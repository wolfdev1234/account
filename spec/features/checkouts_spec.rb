# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Checkouts', type: :feature do
  # patron2 below has 2 checkouts
  let(:mock_user) { 'patron2' }

  before do
    login_permanently_as username: 'PATRON2', patron_key: mock_user
    visit checkouts_path
  end

  after do
    Warden::Manager._on_request.clear
    Redis.current.flushall
  end

  context 'when visiting the checkouts page', js: true do
    it 'is accessible' do
      expect(page).to be_accessible
    end
  end

  context 'when patron renews a checkout successfully', js: true do
    before do
      page.check 'renewal_list__2145643:5:1'
      page.click_button 'Renew', match: :first
    end

    it 'adds a success badge' do
      expect(page).to have_css '.badge-success', text: 'Successfully renewed'
    end

    it 'displays renewals summary' do
      expect(page).to have_css '.renewals-summary',
                               text: "Renewals processing completed.\n1 successfully renewed\n0 failed to renew"
    end

    it 'updates the renewal count, due date and status' do
      expect(page).to have_css('[id="checkout2145643:5:1"] .renewal_count', text: '70')
        .and have_css('[id="checkout2145643:5:1"] .due-date', text: 'August 13, 2020')
        .and have_css '[id="checkout2145643:5:1"] .status', text: ''
    end

    context 'when renewing the same checkout successfully more than once' do
      it 'success badges gets cleared each time' do
        page.check 'renewal_list__2145643:5:1'
        page.click_button 'Renew', match: :first

        expect(page).to have_css '.badge-success', text: 'Successfully renewed', count: 1
      end
    end
  end

  context 'when patron fails to renew a checkout successfully', js: true do
    before do
      page.check 'renewal_list__3591032:1:1'
      page.click_button 'Renew', match: :first
    end

    it 'adds a badge for failed renewal' do
      expect(page).to have_css '.badge-danger', text: 'Failed to renew'
    end

    it 'generates an error message (a "toast")' do
      expect(page).to have_css('.toast')
    end

    it 'displays renewals summary' do
      expect(page).to have_css '.renewals-summary',
                               text: "Renewals processing completed.\n0 successfully renewed\n1 failed to renew"
    end
  end

  context 'when patron uses browser back button to checkouts page' do
    it 'forces checkout page to reload', js: true do
      visit summaries_path
      page.go_back
      expect(page).to have_css '[id="checkout2145643:5:1"]'
    end
  end
end
