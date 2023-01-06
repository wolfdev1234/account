# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ChangePickupLibraryJob, type: :job do
  describe '#perform_later' do
    let(:ws_args) { { hold_key: 1, session_token: '1s2fa21465', pickup_library: 'UP-PAT' } }

    before do
      stub_request(:any, /example.com/).to_rack(FakeSymphony)
    end

    after do
      Redis.current.flushall
    end

    context 'with valid input' do
      it 'makes a call to the SymphonyClient' do
        described_class.perform_now(**ws_args)
        results = Redis.current.get 'pickup_library_1'

        expect(results).to include('success')
      end
    end

    context 'with valid input that is returned OK from SymphonyClient' do
      it 'sets a Redis value that marks success' do
        described_class.perform_now(**ws_args)
        results = Redis.current.get 'pickup_library_1'

        expect(results).to be_present
      end

      it 'sets a Redis value that contains a translated pickup library code' do
        described_class.perform_now(**ws_args)
        results = Redis.current.get 'pickup_library_1'

        expect(results).to include 'Pattee and Paterno Library - Commons Services Desk'
      end
    end

    context 'with valid input that is returned not OK from SymphonyClient' do
      before do
        stub_request(:post, 'https://example.com/symwsbc/circulation/holdRecord/changePickupLibrary')
          .to_return(status: 500, body: '{ "messageList": [{ "message": "A bad thing happened" }] }', headers: {})
      end

      it 'makes a record of the failure' do
        described_class.perform_now(**ws_args)
        results = Redis.current.get 'pickup_library_1'

        expect(JSON.parse(results)).to include 'id', 'result', 'display_error'
      end
    end
  end
end
