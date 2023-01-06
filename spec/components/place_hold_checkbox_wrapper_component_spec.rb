# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PlaceHoldCheckboxWrapperComponent, type: :component do
  let(:component) { render_inline(described_class.new(volumetric_calls: volumetric_calls)).to_html }

  context 'when volumetric calls are not present' do
    let(:volumetric_calls) { [] }

    it 'does not render if there are not any volumetric_calls present' do
      expect(component).to be_empty
    end
  end

  context 'when volumetric calls are present' do
    let(:volumetric_calls) { [build(:call), build(:call), build(:call)] }

    before do
      volumetric_calls.each do |call|
        call.items.each { |item| allow(item).to receive(:item_type_mapping).and_return(ITEM_TYPE_MAPPING) }
      end
      volumetric_calls.first.record['fields']['volumetric'] = 'no. 1'
      volumetric_calls.second.record['fields']['volumetric'] = 'no. 2'
      volumetric_calls.third.record['fields']['volumetric'] = 'no. 3'
    end

    it 'renders if any volumetric_calls are present' do
      expect(component).not_to be_empty
    end

    it 'renders an input with a unique id attribute by barcode' do
      expect(component).to have_css('input#barcodes_000080793182')
    end

    it 'renders a label with a matching unique for attribute based on barcode' do
      expect(component).to have_css('label[for="barcodes_000080793182"]')
    end
  end
end
