# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SummariesController do
  let(:mock_patron) { instance_double(Patron) }
  let(:mock_client) { instance_double(SymphonyClient) }

  before do
    allow(SymphonyClient).to receive(:new).and_return(mock_client)
  end

  context 'with an unauthenticated request' do
    it 'redirects to the home page' do
      expect(get(:index)).to redirect_to root_url
    end
  end

  context 'with an authenticated request' do
    let(:user) {
      instance_double(User,
                      username: 'zzz123',
                      name: 'Zeke',
                      patron_key: '1234567',
                      session_token: 'e0b5e1a3e86a399112b9eb893daeacfd')
    }

    let(:mock_response) do
      {
        fields: {
          circRecordList: [{ key: 1 }]
        }
      }.with_indifferent_access
    end

    let(:ping_response) { true }

    before do
      warden.set_user(user)
      allow(controller).to receive(:current_user).and_return(user)
      allow(mock_client).to receive(:patron_info).with(patron_key: user.patron_key,
                                                       session_token: user.session_token, item_details: { all: true })
        .and_return(mock_response)
      allow(mock_client).to receive(:ping?).and_return(ping_response)
    end

    it 'redirects to the home page' do
      expect(get(:index)).to render_template 'index'
    end

    context 'with a stale session' do
      let(:ping_response) { false }

      before do
        allow(controller).to receive(:current_user?).and_return(true, false)
      end

      it 'redirects to the application authentication mechanism' do
        get(:index)

        expect(response).to redirect_to root_url
      end
    end
  end
end
