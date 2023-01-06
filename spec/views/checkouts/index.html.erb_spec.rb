# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'checkouts/index.html.erb', type: :view do
  let(:checkout) { build(:checkout) }

  before do
    assign 'patron_key', '123'
  end

  it 'creates a div with a data attribute containing the patron_key' do
    render

    expect(rendered).to include '<div class="load-checkouts" data-patron-key="123">'
  end
end
