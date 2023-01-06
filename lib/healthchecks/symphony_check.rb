# frozen_string_literal: true

module HealthChecks
  class SymphonyCheck < OkComputer::Check
    def check
      client = SymphonyClient.new
      status, resp = client.login(Settings.symws.username, Settings.symws.pin)
      if status > 200
        mark_failure
        mark_message resp
      else
        mark_message 'Successfully Logged In'
      end
    end
  end
end
