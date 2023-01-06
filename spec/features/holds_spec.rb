# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Holds', type: :feature do
  # patron1 below has 1 hold ready for pick and 4 holds not yet ready for pickup
  let(:mock_user) { 'patron1' }

  before do
    login_permanently_as username: 'PATRON1', patron_key: mock_user
  end

  after do
    Warden::Manager._on_request.clear
    Redis.current.flushall
  end

  context 'when a patron has some holds not yet ready to pickup (i.e., pending)' do
    before do
      visit holds_path
    end

    it 'is accessible', js: true do
      expect(page).to be_accessible
    end

    describe 'change_pickup_library' do
      before do
        page.check 'hold_list__3911148'
        page.select 'Penn State York', from: 'pickup_library'
        page.click_button 'Update Selected Holds'
      end

      it 'lets the user change the pickup library of a hold', js: true do
        expect(page).to have_css '.badge-success', text: 'Successfully changed pickup location'
        expect(page).to have_css '#hold3911148 .pickup_at', text: 'York'
        expect(page).to have_unchecked_field 'hold_list__3911148'
      end

      context 'when the user successfully changes the pickup library of the same hold more than once' do
        xit 'success badges gets cleared each time', js: true do
          page.find("input[type='checkbox'][id='hold_list__3911148']").click
          page.select 'Berks Campus Library', from: 'pickup_library'
          page.click_button 'Update Selected Holds'

          expect(page.find('.badge-success')).to have_text 'Successfully changed pickup location', count: 1
        end
      end
    end

    describe 'change_pickup_by_date' do
      before do
        page.check 'hold_list__3911148'
        page.fill_in 'pickup_by_date', with: '01-01-9999'
        page.click_button 'Update Selected Holds'
      end

      it 'lets the user change the pickup by date of a hold', js: true do
        expect(page).to have_css '.badge-success', text: 'Successfully updated pickup by date'
        expect(page).to have_css '#hold3911148 .pickup-by', text: 'January 1, 9999'
        expect(page).to have_unchecked_field 'hold_list__3911148'
      end

      context 'when the user successfully changes the pickup up by date of the same hold more than once' do
        it 'success badges gets cleared each time', js: true do
          page.check 'hold_list__3911148'
          page.fill_in 'pickup_by_date', with: '01-01-2020'
          page.click_button 'Update Selected Holds'

          expect(page).to have_css '.badge-success', text: 'Successfully updated pickup by date', count: 1
        end
      end
    end

    it 'lets the user cancel a pending hold', js: true do
      page.check 'hold_list__3911148'
      page.click_button 'Cancel'
      expect(page).to have_css '#hold3911148 .hold_status', text: 'Canceled'
      expect(page).to have_css '.badge-success', text: 'Hold canceled'
      expect(page).to have_unchecked_field 'hold_list__3911148'
    end

    it 'lets the user cancel a ready for pickup hold', js: true do
      page.check 'hold_list__3906718'
      page.click_button 'Cancel Selected Holds'
      expect(page).to have_css '#hold3906718 .hold_status', text: 'Canceled'
      expect(page).to have_css '.badge-success', text: 'Hold canceled'
      expect(page).to have_unchecked_field 'hold_list__3911148'
    end
  end

  context 'when a patron attempts to create a hold for a monograph', js: true do
    before do
      visit '/holds/new?catkey=6066288'
    end

    it 'is accessible', js: true do
      expect(page).to be_accessible
    end

    it 'renders a form for the item being requested' do
      expect(page).to have_text 'Title: 13 bankers : the Wall Street takeover and the next financial meltdown'
    end

    it 'allows user to place a hold for a holdable item', js: true do
      select 'College of Medicine (Hershey)', from: 'pickup_library'
      fill_in 'pickup_by_date', with: '10-10-2050'

      page.click_button 'Place Hold'
      expect(page).to have_text 'Hold Placed'
    end

    it 'displays Back To Catalog link with the catkey', js: true do
      select 'College of Medicine (Hershey)', from: 'pickup_library'
      fill_in 'pickup_by_date', with: '10-10-2050'

      page.click_button 'Place Hold'
      expect(page).to have_link 'Back to Catalog', href: 'https://catalog.libraries.psu.edu/catalog/6066288'
    end

    context 'when patron uses browser back button to place hold result page' do
      it 'redirects to 404', js: true do
        select 'College of Medicine (Hershey)', from: 'pickup_library'
        fill_in 'pickup_by_date', with: '10-10-2050'

        page.click_button 'Place Hold'
        expect(page).to have_text 'Hold Placed'
        visit summaries_path
        page.go_back

        expect(page).to have_current_path('/not_found')
      end
    end
  end

  context 'when patron uses browser back button to holds page' do
    it 'forces checkout page to reload', js: true do
      visit holds_path
      visit summaries_path
      page.go_back
      expect(page).to have_css '#hold3911148'
    end
  end

  context 'when site is in maintenance mode' do
    after do
      Settings.maintenance_mode = false
    end

    it 'removes the checkboxes and hold cancellation buttons', js: true do
      Settings.maintenance_mode = true

      visit holds_path

      expect(page).not_to have_unchecked_field '.checkbox'
      expect(page).not_to have_button 'Cancel'
      expect(page).not_to have_button 'Cancel Selected Holds'
    end
  end
end
