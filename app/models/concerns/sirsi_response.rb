# frozen_string_literal: true

class SirsiResponse
  attr_reader :response_raw, :response_hash

  def initialize(response)
    @response_raw = response.body
    @response_hash = JSON.parse @response_raw
  end

  def messages
    return nil unless @response_hash&.dig 'messageList'

    message_array = @response_hash&.dig 'messageList'
    message_array.map do |code_and_message|
      {
        code: code_and_message&.dig('code'),
        message: code_and_message&.dig('message')
      }
    end
  end

  def hold
    return Hold.new @response_hash if @response_hash['resource'] == '/circulation/holdRecord'

    Hold.new @response_hash['holdRecord'] || nil
  end

  def item
    Item.new @response_hash || nil
  end
end
