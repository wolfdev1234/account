# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'summaries/index', type: :view do
  let(:fines) { [build(:fine)] }
  let(:patron_standing) { {} }
  let(:eligible_for_wage_garnishment) { false }
  let(:patron) do
    instance_double(
      Patron,
      display_name: 'Test First Last',
      checkouts: [],
      holds: [],
      fines: fines,
      eligible_for_wage_garnishment?: eligible_for_wage_garnishment,
      **patron_standing
    )
  end

  before do
    controller.singleton_class.class_eval do
      protected

        def patron; end

        def current_user?; end

        helper_method :patron, :current_user?
    end

    allow(view).to receive(:patron).and_return(patron)
    allow(view).to receive(:current_user?).and_return(true)
  end

  context 'when the patron standing is OK' do
    let(:patron_standing) { { standing_human: '' } }

    it 'renders without alerts' do
      render

      expect(rendered).not_to have_css('h3', text: 'Alerts:')
    end
  end

  context 'when the patron standing is not OK' do
    let(:patron_standing) { { standing_human: 'The user is BARRED.' } }

    it 'renders with alerts' do
      render

      expect(rendered).to have_css('h3', text: 'Alerts:')
    end

    context 'when the user is eligible for wage garnishment' do
      let(:eligible_for_wage_garnishment) { true }

      it 'shows a link to the accept lending policy page' do
        render

        expect(rendered).to have_link('accept the University Libraries lending policy',
                                      href: lending_policy_accept_path)
      end
    end

    context 'when the user is not eligible for wage garnishment' do
      it 'does not show a link to the accept lending policy page' do
        render

        expect(rendered).not_to have_link('accept the University Libraries lending policy')
      end
    end
  end

  context 'when the patron does not have any checkouts, holds or bills' do
    let(:patron_standing) { { standing_human: '' } }
    let(:fines) { [] }

    it 'renders text for no materials and no bills' do
      render

      expect(rendered).to include('You do not have any outstanding materials or bills.')
    end
  end
end
