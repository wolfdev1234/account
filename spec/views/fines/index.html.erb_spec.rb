# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'fines/index.html.erb', type: :view do
  context 'when there are no fines' do
    it 'displays the "no fines" text' do
      render

      expect(rendered).to include 'You have no bills or fines at this time.'
    end
  end

  context 'when a single fine exists' do
    let(:fine) { build(:fine) }

    before do
      assign(:fines, [fine])
      allow(fine).to receive(:item_type_mapping).and_return(ITEM_TYPE_MAPPING)
    end

    it 'displays fine dollar amount correctly' do
      fine.record['fields']['owed']['amount'] = '100.00'
      render
      expect(rendered).to include '$100.00'
    end

    it 'displays fine\'s reason correctly' do
      fine.record['fields']['block']['fields']['description'] = 'Fee for damaged materials'
      render
      expect(rendered).to include 'Fee for damaged materials'
    end

    it 'displays fine\'s item\'s title' do
      fine.record['fields']['item']['fields']['bib']['fields']['title'] = 'A wonderful title'
      render
      expect(rendered).to include 'A wonderful title'
    end

    it 'displays customized title if the fine does not have an item associated with it' do
      fine.record['fields']['item'] = nil
      render
      expect(rendered).to include 'Not associated with an item'
    end

    it 'displays fine\'s item\'s author' do
      fine.record['fields']['item']['fields']['bib']['fields']['author'] = 'A wonderful author'
      render
      expect(rendered).to include 'A wonderful author'
    end

    it 'displays fine\'s item\'s canonical item link' do
      fine.record['fields']['item']['fields']['bib']['key'] = '123456'
      render
      expect(rendered).to include 'catalog.libraries.psu.edu/catalog/123456'
    end

    it 'displays fine\'s item\'s item type' do
      fine.record['fields']['item']['fields']['itemType']['key'] = 'PERIODICAL'
      render
      expect(rendered).to include 'Bound Journal'
    end

    it 'displays fine\'s bill date' do
      fine.record['fields']['billDate'] = '1999-12-31'
      render
      expect(rendered).to include 'December 31, 1999'
    end
  end
end
