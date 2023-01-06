# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RenewCheckoutJob, type: :job do
  describe '#perform_later' do
    let(:ws_args) { { item_key: '2145643:5:1',
                      resource: '/catalog/item',
                      session_token: '1s2fa21465' } }
    let(:success_hash) { { 'id' => '2145643:5:1',
                           'response' => { 'badge' => '<span class="badge badge-pill badge-success">Successfully '\
                                                      'renewed</span>',
                                           'due_date' => 'August 13, 2020',
                                           'renewal_count' => 70,
                                           'status' => '' },
                           'result' => 'success' } }

    before do
      stub_request(:any, /example.com/).to_rack(FakeSymphony)
    end

    after do
      Redis.current.flushall
    end

    context 'with valid input that is returned OK from SymphonyClient' do
      it 'sets a Redis value that marks success' do
        described_class.perform_now(**ws_args)
        results = Redis.current.get 'renewal_2145643:5:1'

        expect(results).to include 'success'
      end

      it 'sets a Redis value that contains a translated item key' do
        described_class.perform_now(**ws_args)
        results = Redis.current.get 'renewal_2145643:5:1'

        expect(JSON.parse(results)).to eq(success_hash)
      end
    end

    context 'with valid input that is returned not OK from SymphonyClient' do
      let(:error_prompt) do
        { messageList: [{ code: 'some_other_code', message: 'Some error message' }] }.to_json
      end

      before do
        stub_request(:post, 'https://example.com/symwsbc/circulation/circRecord/renew?includeFields=circRecord%7B*%7D')
          .with(body: { item: { resource: '/catalog/item', key: '2145643:5:1' } })
          .to_return(status: 400, body: error_prompt, headers: {})
      end

      it 'makes a record of the failure' do
        described_class.perform_now(**ws_args)
        results = Redis.current.get 'renewal_2145643:5:1'

        expect(JSON.parse(results)).to include 'id', 'result', 'display_error'
      end
    end
  end
end
