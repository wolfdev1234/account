# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Checkouts', type: :feature do
  # patron2 below has 2 checkouts

  after do
    Redis.current.flushall
  end

  context 'when patron is renewing checkouts' do
    let(:mock_user) { 'patron2' }

    before do
      login_as username: 'PATRON2', patron_key: mock_user
    end

    it 'shows a modal telling the user to start a new session', js: true do
      visit checkouts_path
      page.driver.browser.manage.delete_cookie '_myaccount_session'
      page.check 'renewal_list__2145643:5:1'
      page.click_button 'Renew'

      expect(page).to have_css '#expiryModal'
    end
  end

  context 'when patron is updating holds' do
    let(:mock_user) { 'patron1' }

    before do
      login_as username: 'PATRON1', patron_key: mock_user
      visit holds_path
    end

    it 'interrupts a change of library with a modal explaining the problem', js: true do
      page.driver.browser.manage.delete_cookie '_myaccount_session'
      page.check 'hold_list__3911148'
      page.select 'Penn State Berks', from: 'pickup_library'
      page.click_button 'Update Selected Holds'

      expect(page).to have_css '#expiryModal'
    end

    it 'interrupts a change of pick up by with a modal explaining the problem', js: true do
      page.driver.browser.manage.delete_cookie '_myaccount_session'
      page.check 'hold_list__3911148'
      page.fill_in 'pickup_by_date', with: '01-01-9999'
      page.click_button 'Update Selected Holds'

      expect(page).to have_css '#expiryModal'
    end

    it 'interrupts a cancel with a modal explaining the problem', js: true do
      page.driver.browser.manage.delete_cookie '_myaccount_session'
      page.check 'hold_list__3911148'
      page.click_button 'Cancel'

      expect(page).to have_css '#expiryModal'
    end
  end
end
