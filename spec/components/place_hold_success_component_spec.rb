# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PlaceHoldSuccessComponent, type: :component do
  let(:hold) do
    instance_double Hold,
                    title: 'Some Title',
                    author: 'Somebody',
                    catkey: 'a_catkey',
                    call_number: 'a_call_number',
                    item_type_code: 'Book',
                    item_type_human: 'Book',
                    pickup_library_human: 'UP-PAT',
                    fill_by_date: Time.zone.parse('2020-02-20T00:00:00-05:00'),
                    shadowed?: false
  end

  it 'renders when there is a hold placed' do
    result = { placed_hold: hold }.with_indifferent_access
    component = render_inline(described_class.new(result: result)).to_html
    expect(component).to include('Some Title / Somebody', 'Book', 'a_call_number', 'UP-PAT', 'February 20, 2020')
  end

  it 'does not render when there is not a hold placed' do
    result = {}
    component = render_inline(described_class.new(result: result)).to_html
    expect(component).to be_empty
  end
end
