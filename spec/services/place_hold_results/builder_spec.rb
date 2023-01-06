# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PlaceHoldResults::Builder, type: :service do
  subject(:builder) { described_class.new(user_token: 'a-cool-token',
                                          client: real_client,
                                          place_hold_results: place_hold_results) }

  let(:place_hold_results) { {
    success: [{ barcode: 'holdable_barcode', hold_key: '3912325' }],
    error: [{ barcode: 'not_holdable_barcode', error_message: 'User already has a hold on this material' }]
  } }
  let(:processed_results) { builder.generate }
  let(:real_client) { SymphonyClient.new }

  after do
    Redis.current.flushall
  end

  describe '#generate' do
    it 'will pass along processed placed holds results' do
      expect(processed_results[:success].first).to include(hold_key: '3912325')
        .and include(barcode: 'holdable_barcode')
        .and include(:placed_hold)
    end

    it 'returns Hold objects for placed holds' do
      expect(processed_results[:success].first[:placed_hold].pickup_library_human)
        .to be_truthy
    end

    it 'returns correct Hold for each success' do
      expect(processed_results[:success].first[:placed_hold].key).to eq '3912325'
    end

    it 'will pass along processed failed holds results' do
      expect(processed_results[:error].first).to include(barcode: 'not_holdable_barcode')
        .and include(error_message: 'User already has a hold on this material')
        .and include(:failed_hold)
    end

    it 'returns correct Item for each error' do
      expect(processed_results[:error].first[:barcode]).to eq 'not_holdable_barcode'
    end

    context 'when hold lookup does not return item level info' do
      let(:place_hold_results) { {
        success: [{ barcode: 'holdable_barcode', hold_key: 'a_hold_key' }]
      } }

      it 'tries hold lookup again until item info returns not empty' do
        expect(processed_results[:success].first[:placed_hold].title).to eq 'National review'
      end
    end
  end
end
