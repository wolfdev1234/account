# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GenericValueWithLabelComponent, type: :component do
  let(:value) { 'Eleventy Billion' }
  let(:label) { 'Number of Insects' }
  let(:rendered_component) { render_inline(described_class.new(label: label, value: value)) }

  context 'when given an arbitrary simple field and value' do
    it 'produces a label to go along with the value' do
      expect(rendered_component.to_html).to include '<strong>Number of Insects:</strong> Eleventy Billion'
    end
  end

  context 'when the given value is nil' do
    let(:value) { nil }

    it 'does not print anything' do
      expect(rendered_component.to_html).to be_empty
    end
  end
end
