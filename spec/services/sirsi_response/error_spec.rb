# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SirsiResponse::Error, type: :service do
  describe '#initialize' do
    # Creates actual SymphonyClient object, stubs API responses with Sinatra
    subject(:error) { described_class.new error_message_raw: error_response_obj,
                                          symphony_client: SymphonyClient.new,
                                          key: '123457',
                                          session_token: '92929292',
                                          bib_type: 'checkout' }

    let(:error_code) { 'Not a real code 1234' }
    let(:error_message) { 'Some error message' }
    let(:error_response_obj) { instance_double(HTTP::Response) }

    before do
      allow(error_response_obj).to receive(:body).and_return(
        { 'messageList' => [{ 'code' => error_code, 'message' => error_message }] }.to_json
      )
    end

    after do
      Redis.current.flushall
    end

    context 'when an error occurs that does not have a translation' do
      it 'returns a generic error response in HTML' do
        expect(error.html).to include '<p>Some error message Contact your campus library if you need assistance.</p>'
      end

      it 'logs the server response from Sirsi' do
        expect(error.log).to include 'messageList' => [{ 'code' => 'Not a real code 1234',
                                                         'message' => 'Some error message' }]
      end
    end

    context 'when an error for a hold occurs that is malformed' do
      let(:error_message) { nil }

      it 'returns a generic error response in HTML' do
        expect(error.html).to include '<p>Something went wrong Contact your campus library if you need assistance.</p>'
      end

      it 'logs the server response from Sirsi' do
        expect(error.log).to include 'messageList' => [{ 'code' => 'Not a real code 1234', 'message' => nil }]
      end
    end

    context 'when an error for a checkout occurs that has a translation' do
      let(:error_code) { 'hatErrorResponse.46' }

      it 'returns a generic error response in HTML' do
        expect(error.html).to include '<p>Denied: Item on reserve, cannot be renewed.'
      end

      it 'logs the server response from Sirsi' do
        expect(error.log).to include 'messageList' => [{ 'code' => 'hatErrorResponse.46',
                                                         'message' => 'Some error message' }]
      end
    end
  end
end
