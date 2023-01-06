# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ChangePickupByDateJob, type: :job do
  describe '#perform_later' do
    let(:ws_args) { { hold_key: 1, session_token: '1s2fa21465', pickup_by_date: '20201212' } }

    before do
      stub_request(:any, /example.com/).to_rack(FakeSymphony)
    end

    after do
      Redis.current.flushall
    end

    context 'with valid input' do
      it 'makes a call to the SymphonyClient' do
        described_class.perform_now(**ws_args)
        results = Redis.current.get 'pickup_by_date_1'

        expect(results).to include('success')
      end
    end

    context 'with valid input that is returned OK from SymphonyClient' do
      it 'sets a Redis value that marks success' do
        described_class.perform_now(**ws_args)
        results = Redis.current.get 'pickup_by_date_1'

        expect(results).to be_present
      end

      it 'sets a Redis value that contains a human-friendly formatted date string' do
        described_class.perform_now(**ws_args)
        results = Redis.current.get 'pickup_by_date_1'

        expect(results).to include 'December 12, 2020'
      end
    end

    context 'with valid input that is returned not OK from SymphonyClient' do
      before do
        stub_request(:put, 'https://example.com/symwsbc/circulation/holdRecord/key/1')
          .to_return(status: 500, body: '{ "messageList": [{ "message": "A bad thing happened" }] }', headers: {})
      end

      it 'makes a record of the failure' do
        described_class.perform_now(**ws_args)
        results = Redis.current.get 'pickup_by_date_1'

        expect(JSON.parse(results)).to include 'id', 'result', 'display_error'
      end
    end
  end
end
