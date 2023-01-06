# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'holds/_form_inputs.html.erb', type: :view do
  let(:bib) { build(:bib_with_holdables) }
  let(:page) { Capybara.string(rendered) }

  before do
    assign(:bib, bib)
  end

  context 'when validation is set to be on' do
    before do
      render partial: 'holds/form_inputs.html.erb', locals: { validate_pickup_info: true,
                                                              make_default: true,
                                                              selected: 'UP-PAT' }
    end

    it 'will set a min attribute for pickup by date' do
      input = page.find('input#pickup_by_date')
      expect(input['min']).not_to be_nil
    end

    it 'will mark pickup by date as required' do
      input = page.find('input#pickup_by_date')

      expect(input['required']).not_to be_nil
    end

    it 'will mark pickup library as required' do
      input = page.find('select#pickup_library')

      expect(input['required']).not_to be_nil
    end
  end

  context 'when validation is set to be off' do
    before do
      render partial: 'holds/form_inputs.html.erb', locals: { validate_pickup_info: false,
                                                              make_default: false,
                                                              selected: 'UP-PAT' }
    end

    it 'will not mark pickup date as required' do
      input = page.find('input#pickup_by_date')

      expect(input['required']).to be_nil
    end

    it 'will not mark pickup library as required' do
      input = page.find('select#pickup_library')

      expect(input['required']).to be_nil
    end
  end
end
