# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PlaceHoldsJob, type: :job do
  let(:ws_args) { {
    patron_key: 'patron1',
    barcodes: ['1'],
    catkey: '1',
    session_token: 'session_token',
    pickup_library: 'UP-PAT',
    pickup_by_date: '01-20-2021'
  } }

  after do
    Redis.current.flushall
  end

  context 'with valid input' do
    before do
      stub_request(:any, /example.com/).to_rack(FakeSymphony)
    end

    it 'sets a Redis record containing success denoted by patron\'s key' do
      described_class.perform_now(**ws_args)
      results = Redis.current.get 'place_holds_results_patron1'

      expect(results).to be_present
    end

    it 'renders HTML containing the checkouts and saves to redis' do
      described_class.perform_now(**ws_args)
      results = Redis.current.get 'place_holds_results_patron1'

      expect(results).to include '1 Hold Placed'
    end
  end

  context 'when SymphonyClient does not respond with 200/OK' do
    before do
      stub_request(:post, 'https://example.com/symwsbc/circulation/holdRecord/placeHold')
        .to_return(status: 500, body: '{ "messageList": [{ "message": "A bad thing happened" }] }', headers: {})
    end

    it 'sets a Redis record containing failure denoted by patron\'s key' do
      described_class.perform_now(**ws_args)
      results = Redis.current.get 'place_holds_results_patron1'

      expect(results).to include '1 Hold Failed'
    end
  end
end
