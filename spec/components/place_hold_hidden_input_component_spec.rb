# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PlaceHoldHiddenInputComponent, type: :component do
  it 'renders when there\'s a barcode' do
    component = render_inline(described_class.new(barcode: '1')).to_html
    expect(component).not_to be_empty
  end

  it 'does not render when there is not a barcode' do
    component = render_inline(described_class.new(barcode: nil)).to_html
    expect(component).to be_empty
  end
end
