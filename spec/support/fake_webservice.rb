# frozen_string_literal: true

require 'sinatra/base'

class FakeWebservice < Sinatra::Base
  private

    def json_response(response_code, file_name)
      content_type :json
      status response_code
      File.open("#{File.dirname(__FILE__)}/data/#{file_name}", 'rb').read
    end
end
