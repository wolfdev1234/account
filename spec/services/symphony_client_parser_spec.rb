# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SymphonyClientParser do
  let(:symphony_client) { instance_double(SymphonyClient) }
  let(:get_hold_info_response) { instance_double(HTTP::Response) }

  params = ['fakekey', 'faketoken']

  before do
    allow(symphony_client).to receive(:get_hold_info).with(*params).and_return(get_hold_info_response)
    allow(get_hold_info_response).to receive(:body).and_return HOLD_LOOKUP_RAW_JSON.to_json
  end

  describe '.parsed_response' do
    it 'return the parsed Symphony response' do
      response = described_class::parsed_response(symphony_client, :get_hold_info, *params)
      expect(response).to include 'key' => 'a_hold_key'
    end
  end
end
