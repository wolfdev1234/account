# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'layouts/application', type: :view do
  before do
    without_partial_double_verification do
      allow(view).to receive(:patron).and_return(mock_patron)
    end
  end

  context 'with an authenticated request' do
    let(:mock_patron) { instance_double Patron, id: 'idhere', valid?: true }

    it 'displays the navigation' do
      render

      expect(rendered).to have_css '#navbarNav'
    end

    context 'when site is not in maintenance mode' do
      after do
        Settings.maintenance_mode = false
      end

      it 'does not add the system maintenance notice' do
        assign('patron', instance_double(Patron, id: 'idhere'))

        render

        expect(rendered).not_to have_text 'System Maintenance'
      end
    end

    context 'when site is in maintenance mode' do
      after do
        Settings.maintenance_mode = false
      end

      it 'adds the system maintenance notice' do
        assign('patron', instance_double(Patron, id: 'idhere'))
        Settings.maintenance_mode = true

        render

        expect(rendered).to have_text 'System Maintenance'
      end
    end

    context 'when announcement bar is enabled' do
      after do
        Settings.show_announcement = false
      end

      it 'adds the announcement message on top' do
        assign('patron', instance_double(Patron, id: 'idhere'))
        Settings.show_announcement = true

        render

        expect(rendered).to have_selector '.announcement'
      end
    end
  end
end
