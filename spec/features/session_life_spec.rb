# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Session cookies', type: :feature do
  let(:mock_user) { 'patron1' }

  before do
    login_permanently_as username: 'PATRON1', patron_key: mock_user
    visit root_path
  end

  after do
    Warden::Manager._on_request.clear
  end

  describe 'the session cookies', js: true do
    context 'when starting a fresh session' do
      it 'sets session cookies' do
        session_began_cookie = page.driver.browser.manage.cookie_named(:session_began)
        last_active_cookie = page.driver.browser.manage.cookie_named(:last_active)

        expect(session_began_cookie[:value]).to be_present
        expect(last_active_cookie[:value]).to be_present
      end
    end

    xcontext 'when a user has not done anything in the application for a duration greater than the last_active value' do
      xit 'sends the user back through authentication and makes new session life cookies' do
      end
    end

    xcontext 'when the user started the session a duration greater than the max session life ago' do
      it 'sends the user back through authentication and makes new session life cookies' do
      end
    end
  end
end
