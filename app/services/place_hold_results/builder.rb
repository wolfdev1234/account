# frozen_string_literal: true

# Responsible for building data needed to populate the place hold results.
class PlaceHoldResults::Builder
  def initialize(user_token:, client:, place_hold_results:)
    @user_token = user_token
    @client = client # SymphonyClient
    @place_hold_results = place_hold_results
  end

  def generate
    @place_hold_results.each do |status, results|
      if status == :success
        results.map { |result| result[:placed_hold] = hold_lookup(result[:hold_key]) }
      else
        results.map { |result| result[:failed_hold] = item_lookup(result[:barcode]) }
      end
    end
  end

  private

    def hold_lookup(hold_key)
      SirsiResponse.new(@client.get_hold_info(hold_key, @user_token)).hold
    end

    def item_lookup(barcode)
      SirsiResponse.new(@client.get_item_info(session_token: @user_token, barcode: barcode)).item
    end
end
