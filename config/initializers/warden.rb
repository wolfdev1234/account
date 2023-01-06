# frozen_string_literal: true

Warden::Strategies.add(:library_id) do
  def valid?
    remote_user
  end

  def remote_user
    user = request.env.fetch(Settings.remote_user_header, false)
    user = user.split('@')[0] if user

    if request.params['masquerade'] && Settings.admin_users.include?(user)
      user = request.params['masquerade']
    end

    user
  end

  def authenticate!
    _status, session_token = SymphonyClient.new.login(Settings.symws.username, Settings.symws.pin)
    response = SymphonyClient.new.get_patron_record(remote_user, session_token) || {}
    if response.fetch('patronKey', nil)
      user = {
        username: remote_user,
        name: response['fields']['displayName'],
        patron_key: response['patronKey'],
        session_token: response['sessionToken']
      }

      success!(user)
    else
      fail!('Could not log in')
    end
  end
end
