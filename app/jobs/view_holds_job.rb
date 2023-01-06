# frozen_string_literal: true

class ViewHoldsJob < ApplicationJob
  include ActionController::Rendering

  queue_as :default

  def perform(patron_key:, session_token:)
    response = symphony_client.patron_info(patron_key: patron_key,
                                           session_token: session_token,
                                           item_details: { holdRecordList: true })
    patron = Patron.new(response)

    return process_failure(error_message: response, patron_key: patron_key) if patron.key.blank?

    holds_ready = patron.holds.select(&:ready_for_pickup?)
    holds_not_ready = patron.holds.reject(&:ready_for_pickup?)
    html = HoldsController.render template: 'holds/all', layout: false, locals: { holds_ready: holds_ready,
                                                                                  holds_not_ready: holds_not_ready }
    if response.present?
      Redis.current.set("view_holds_#{patron_key}", {
        result: :success,
        html: html
      }.to_json)
      nil
    end
  end

  private

    def process_failure(error_message:, patron_key:)
      Sidekiq.logger.error("view_holds_#{patron_key}: #{error_message}")
      Redis.current.set("view_holds_#{patron_key}", {
        result: :failure,
        response: error_message
      }.to_json)
    end
end
