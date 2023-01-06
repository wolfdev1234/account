# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BibItemComponent, type: :component do
  let(:hold) { build(:hold) }
  let(:component) { render_inline(described_class.new(bibitem: hold)).to_html }

  before do
    allow(hold).to receive(:item_type_mapping).and_return(ITEM_TYPE_MAPPING)
  end

  it 'renders a bib item with an author' do
    hold.record['fields']['bib']['fields']['title'] = 'A wonderful title'
    hold.record['fields']['bib']['fields']['author'] = 'A wonderful author'

    expect(component).to include 'A wonderful title / A wonderful author'
  end

  it 'renders a bib item without an author' do
    hold.record['fields']['bib']['fields']['title'] = 'A wonderful title'
    hold.record['fields']['bib']['fields']['author'] = ''

    expect(component).to include 'A wonderful title'
  end

  context 'when bib item type is anything but PALCI' do
    before do
      hold.record['fields']['item']['fields']['itemType']['key'] = 'ATLAS'
    end

    it 'renders a linked title' do
      expect(component).to include 'href'
    end
  end

  context 'when bib item is from PALCI' do
    before do
      hold.record['fields']['item']['fields']['itemType']['key'] = 'PALCI'
    end

    it 'renders an unlinked title' do
      expect(component).not_to include 'href'
    end
  end

  context 'when bib item is shadowed' do
    before do
      hold.record['fields']['item']['fields']['itemType']['key'] = 'ATLAS'
      hold.record['fields']['bib']['fields']['shadowed'] = true
    end

    it 'renders an unlinked title' do
      expect(component).not_to include 'href'
    end
  end

  context 'when bib item is not shadowed' do
    before do
      hold.record['fields']['item']['fields']['itemType']['key'] = 'ATLAS'
      hold.record['fields']['bib']['fields']['shadowed'] = false
    end

    it 'renders a linked title' do
      expect(component).to include 'href'
    end
  end

  context 'when record passed doesn\'t contain a bib item, for example a fine without a bib item' do
    it 'doesn\'t render anything' do
      hold.record['fields']['item'] = nil
      hold.record['fields']['bib'] = nil

      expect(component).to be_empty
    end
  end
end
