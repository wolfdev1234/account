# frozen_string_literal: true

class ChangePickupByDateJob < ApplicationJob
  queue_as :default

  def perform(hold_key:, session_token:, pickup_by_date:)
    response = symphony_client.not_needed_after(
      hold_key: hold_key,
      fill_by_date: pickup_by_date,
      session_token: session_token
    )

    case response.status
    when 200

      Redis.current.set("pickup_by_date_#{hold_key}", {
        id: hold_key,
        result: :success,
        response: {
          new_value: pickup_by_date,
          new_value_formatted: Date.parse(pickup_by_date).strftime('%B %-d, %Y'),
          badge: badge(message: 'Successfully updated pickup by date')
        }
      }.to_json)
    else
      processed_error = SirsiResponse::Error.new(error_message_raw: response,
                                                 symphony_client: symphony_client,
                                                 key: hold_key,
                                                 session_token: session_token,
                                                 bib_type: :hold)

      Sidekiq.logger.error("pickup_by_date_#{hold_key}: #{processed_error.log}")

      Redis.current.set("pickup_by_date_#{hold_key}", {
        id: hold_key,
        result: :failure,
        display_error: processed_error.html
      }.to_json)
    end
  end
end
