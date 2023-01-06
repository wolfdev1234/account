# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'checkouts/all.html.erb', type: :view do
  context 'when patron has checkouts to display' do
    let(:checkout) { build(:checkout) }

    before do
      stub_request(:any, /example.com/).to_rack(FakeSymphony)

      render template: 'checkouts/all.html.erb', locals: {
        checkouts: [checkout]
      }
    end

    it 'displays total checked out correctly' do
      expect(rendered).to include 'Total Checked Out: 1'
    end

    it 'displays total # of recalled items correctly' do
      expect(rendered).to include 'Recalled: 1'
    end

    it 'displays total # of overdue items correctly' do
      expect(rendered).to include 'Overdue: 1'
    end

    it 'displays checkout\'s item\'s bib info' do
      expect(rendered).to include 'Won&#39;t you be my neighbor? / Neville, Morgan',
                                  'Video Material', 'PN1992.4.R56W66 2018 DVD'
    end

    it 'displays checkout\'s item\'s canonical item link' do
      expect(rendered).to include 'catalog.libraries.psu.edu/catalog/24053411'
    end

    it 'displays checkout\'s renewal count' do
      expect(rendered).to include '<td class="renewal_count"><span>2</span></td>'
    end

    it 'displays checkout\'s estimated overdue amount when item is overdue' do
      expect(rendered).to include '$10.00'
    end

    it 'displays checkout\'s due date correctly when recalled' do
      expect(rendered).to match /(Recalled<br>)\s*(December 20, 2019<br>)\s*November 14, 2019/
    end

    it 'displays checkout\'s status correctly when overdue' do
      expect(rendered).to include '<td class="status"><span>Overdue</span></td>'
    end

    it 'displays a renew all select' do
      expect(rendered).to have_unchecked_field 'renewal_list__24053411:3:1'
    end

    it 'displays a renew button' do
      expect(rendered).to have_button 'Renew'
    end

    context 'when the site is put into maintenance mode' do
      before :all do
        Settings.maintenance_mode = true
      end

      after do
        Settings.maintenance_mode = false
      end

      it 'does not display a renew button' do
        expect(rendered).not_to have_button 'Renew'
      end
    end
  end
end
