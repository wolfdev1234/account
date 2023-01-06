# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DashboardItemComponent, type: :component do
  let(:dashboard_item_args) { { model: 'Checkouts',
                                count: 50,
                                count_term: 'Total checked out',
                                items: [
                                  {
                                    label: 'overdue',
                                    count: 3
                                  }
                                ] }}
  let(:component) { render_inline(described_class.new(dashboard_item_args)).to_html }

  it 'makes a list' do
    dashboard_item_args[:items] << {
      label: 'recalled',
      count: 2
    }

    expect(component).to include '<li>2  recalled</li>'
  end

  it 'links to a model path' do
    dashboard_item_args[:model] = 'Holds'

    expect(component).to include 'href="/holds"'
  end

  it 'doesn\'t render if count is not positive' do
    dashboard_item_args[:count] = 0

    expect(component).to be_empty
  end

  it 'doesn\'t render items if there aren\'t any items' do
    dashboard_item_args[:items] = nil

    expect(component).not_to include '<ul>'
  end

  it 'renders currency properly' do
    dashboard_item_args[:currency] = true

    expect(component).to include '$'
  end
end
