# frozen_string_literal: true

class PlaceHoldsJob < ApplicationJob
  queue_as :default

  def perform(patron_key:, catkey:, barcodes:, session_token:, **hold_args)
    @barcodes = barcodes
    @session_token = session_token
    @catkey = catkey
    @hold_args = hold_args
    @patron = fetch_patron patron_key

    write_to_redis print_html(batch_results)
  end

  private

    def write_to_redis(html)
      Redis.current.set("place_holds_results_#{@patron.key}", {
        id: @patron.barcode.to_s,
        result: :success,
        response: html
      }.to_json)
    end

    def print_html(results)
      results_builder = PlaceHoldResults::Builder.new(user_token: @session_token,
                                                      client: symphony_client,
                                                      place_hold_results: results)

      ApplicationController.render partial: 'holds/results',
                                   layout: false,
                                   locals: { place_hold_catkey: @catkey, place_hold_results: results_builder.generate }
    end

    def fetch_patron(patron_key)
      patron_response = symphony_client.patron_info patron_key: patron_key,
                                                    session_token: @session_token
      Patron.new patron_response
    end

    def batch_results
      @barcodes.each_with_object(success: [], error: []) do |barcode, status|
        response = symphony_client.place_hold(@patron, @session_token, barcode, @hold_args)

        sirsi_response = SirsiResponse.new response

        if response.status == 200
          status[:success] << { barcode: barcode,
                                hold_key: sirsi_response.hold.key }
        else
          Sidekiq.logger.error("place_holds_results_#{@patron_key} #{barcode}: #{sirsi_response.response_raw}")
          status[:error] << { barcode: barcode,
                              result: :failure,
                              error_message: sirsi_response.messages.first[:message] }
        end
      end
    end
end
