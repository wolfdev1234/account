# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SelectAllComponent, type: :component do
  let(:select_all_args) { { target_keyword: 'renewal' } }

  let(:component) { render_inline(described_class.new(select_all_args)).to_html }

  context 'when site is in maintenance mode' do
    after do
      Settings.maintenance_mode = false
    end

    it 'does not render' do
      Settings.maintenance_mode = true

      expect(component).to be_empty
    end
  end

  it 'makes a select all checkbox' do
    expect(component).to include 'input type="checkbox" name="renewal_all"'
  end

  it 'adds the correct data attribute to bind the target checkboxes' do
    expect(component).to include 'data-select-all="renewal"'
  end

  it 'render a label for select all' do
    expect(component).to include '<label class="sr-only" for="renewal_all">All</label>'
  end
end
