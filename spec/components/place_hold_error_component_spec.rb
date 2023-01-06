# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PlaceHoldErrorComponent, type: :component do
  let(:bib) { instance_double Item,
                              title: 'Some Title',
                              author: 'Somebody',
                              catkey: 'a_catkey',
                              call_number: 'a_call_number',
                              item_type_code: 'Book',
                              item_type_human: 'Book',
                              shadowed?: false }
  let(:error_message) { 'User already has a hold on this material' }

  it 'renders when there is a failed hold' do
    result = { failed_hold: bib, error_message: error_message }.with_indifferent_access
    component = render_inline(described_class.new(result: result)).to_html
    expect(component).to include('Some Title / Somebody', 'a_call_number', 'Book',
                                 'User already has a hold on this material')
  end

  it 'does not render when there is not an failed hold' do
    result = { failed_hold: bib, error_message: nil }.with_indifferent_access
    component = render_inline(described_class.new(result: result)).to_html
    expect(component).to be_empty
  end
end
