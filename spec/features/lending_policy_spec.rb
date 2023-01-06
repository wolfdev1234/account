# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Lending Policy', type: :feature do
  let(:mock_user) { 'patron1' }

  before do
    login_permanently_as username: 'PATRON1', patron_key: mock_user
    visit lending_policy_show_path
  end

  after do
    Warden::Manager._on_request.clear
    Redis.current.flushall
  end

  describe 'when the user clicks the checkbox', js: true do
    it 'toggles the enabled state of the button' do
      expect(page).to have_button('Accept & Continue', disabled: true)

      page.check 'accept-lending-policy-checkbox'

      expect(page).to have_button('Accept & Continue', disabled: false)
    end
  end

  describe 'when the user submits the form', js: true do
    it 'redirects the user to the thank you page' do
      page.check 'accept-lending-policy-checkbox'
      page.click_button 'Accept & Continue'

      expect(page).to have_current_path lending_policy_thank_you_path, ignore_query: true
    end
  end
end
