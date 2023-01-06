# frozen_string_literal: true

class ViewCheckoutsJob < ApplicationJob
  include ActionController::Rendering

  queue_as :default

  def perform(patron_key:, session_token:)
    response = symphony_client.patron_info(patron_key: patron_key,
                                           session_token: session_token,
                                           item_details: { circRecordList: true })
    patron = Patron.new(response)

    return process_failure(error_message: response, patron_key: patron_key) if patron.key.blank?

    checkouts = patron.checkouts.sort_by(&:due_date)

    html = CheckoutsController.render template: 'checkouts/all', layout: false, locals: { checkouts: checkouts }

    if response.present?
      Redis.current.set("view_checkouts_#{patron_key}", {
        result: :success,
        html: html
      }.to_json)
      nil
    end
  end

  private

    def process_failure(error_message:, patron_key:)
      Sidekiq.logger.error("view_checkouts_#{patron_key}: #{error_message}")
      Redis.current.set("view_checkouts_#{patron_key}", {
        result: :failure,
        response: error_message
      }.to_json)
    end
end
