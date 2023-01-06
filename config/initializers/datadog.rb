# frozen_string_literal: true

if Settings&.datadog&.enabled
  require 'ddtrace'

  SIRSI_RESPONSE_EXCLUDES = [
    'hatErrorResponse.17',
    'hatErrorResponse.91',
    'hatErrorResponse.116',
    'hatErrorResponse.141',
    'hatErrorResponse.7703',
    'hatErrorResponse.105',
    'hatErrorResponse.252',
    'hatErrorResponse.46',
    'hatErrorResponse.238',
    'hatErrorResponse.722',
    'hatErrorResponse.17286',
    'hatErrorResponse.753',
    'unhandledException',
    'recordNotFound',
    'acknowledgeRenewalFeeCircPrompt',
    'invalidPacket',
    'invalidDateFormat',
    'permissionDeniedRecordHidden'
  ].freeze

  Datadog.configure do |c|
    c.service = 'myaccount'
    c.env = Settings.datadog.environment
    c.use :rails
    c.use :httprb, service_name: 'myaccount-httprb'
    c.use :sidekiq, service_name: 'myaccount-sidekiq'
    c.use :redis, service_name: 'myaccount-redis'
  end

  # Monkey patching Datadog
  Datadog::Contrib::Httprb::Instrumentation::InstanceMethods.module_eval do
    private

      def annotate_span_with_response!(span, response)
        return unless response&.code

        span.set_tag(Datadog::Ext::HTTP::STATUS_CODE, response.code)

        case response.code.to_i
        when 400...599
          message = parsed_response response
          code = message&.first&.dig('code')
          span.set_error(["Error #{response.code}", message]) unless SIRSI_RESPONSE_EXCLUDES.include? code
        end
      end

      def parsed_response(response)
        JSON.parse(response.body)&.dig('messageList') || 'Error'
      end
  end
end
