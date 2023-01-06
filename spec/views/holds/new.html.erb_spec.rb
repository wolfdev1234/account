# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'holds/new.html.erb', type: :view do
  let(:form_params) { {
    catkey: '1',
    title: 'How to Eat More Pizza',
    author: 'Samantha Smith',
    volumetric_calls: [],
    barcode: '2'
  } }

  context 'without volumetric holdables to choose' do
    before do
      assign(:place_hold_form_params, form_params)
    end

    it 'does not render checkbox inputs' do
      render

      expect(rendered).to have_css('input[type="checkbox"]', count: 0)
    end

    it 'provides a way to Cancel and go back to the catalog' do
      render

      expect(rendered).to include 'href="https://catalog.libraries.psu.edu/catalog/1">Cancel'
    end
  end

  context 'with volumetric holdables to choose' do
    before do
      form_params[:volumetric_calls] = [build(:call), build(:call)]
      form_params[:volumetric_calls].first.record['fields']['volumetric'] = 'no. 1'
      assign(:place_hold_form_params, form_params)
      form_params[:volumetric_calls].each do |call|
        call.items.each { |item| allow(item).to receive(:item_type_mapping).and_return(ITEM_TYPE_MAPPING) }
      end
    end

    it 'renders checkboxes for every call' do
      render

      expect(rendered).to have_css('input[type="checkbox"]', count: 2)
    end
  end
end
