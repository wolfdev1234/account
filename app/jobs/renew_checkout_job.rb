# frozen_string_literal: true

class RenewCheckoutJob < ApplicationJob
  queue_as :default

  def perform(resource:, item_key:, session_token:)
    response = symphony_client.renew resource: resource,
                                     item_key: item_key,
                                     session_token: session_token

    case response.status
    when 200
      checkout = Checkout.new(JSON.parse(response.body)&.dig('circRecord'))

      due_date = ApplicationController.renderer.render(
        partial: 'checkouts/due_date',
        locals: { checkout: checkout }
      )

      Redis.current.set("renewal_#{item_key}", {
        id: item_key,
        result: :success,
        response: {
          renewal_count: checkout.renewal_count,
          due_date: due_date,
          status: checkout.status_human,
          badge: badge(message: 'Successfully renewed')
        }
      }.to_json)
    else
      processed_error = SirsiResponse::Error.new(error_message_raw: response,
                                                 symphony_client: symphony_client,
                                                 key: item_key,
                                                 session_token: session_token,
                                                 bib_type: :checkout)

      Sidekiq.logger.error("renewal_#{item_key}: #{processed_error.log}")

      Redis.current.set("renewal_#{item_key}", {
        id: item_key,
        result: :failure,
        response: {
          badge: badge(message: 'Failed to renew', badge_class: 'danger')
        },
        display_error: processed_error.html
      }.to_json)
    end
  end
end
