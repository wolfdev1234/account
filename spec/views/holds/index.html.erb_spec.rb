# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'holds/index.html.erb', type: :view do
  let(:hold) { build(:hold) }

  before do
    allow(hold).to receive(:item_type_mapping).and_return(ITEM_TYPE_MAPPING)
    assign 'patron_key', '123'
  end

  it 'creates a div with a data attribute containing the patron_key' do
    render

    expect(rendered).to include '<div class="load-holds" data-patron-key="123">'
  end
end
