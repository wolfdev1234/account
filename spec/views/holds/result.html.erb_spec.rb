# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'holds/result.html.erb', type: :view do
  let(:mock_patron) { instance_double(Patron) }

  before do
    allow(mock_patron).to receive(:display_name).and_return('Jane Doe')
    allow(mock_patron).to receive(:key).and_return('12345')

    controller.singleton_class.class_eval do
      protected

        def patron; end

        helper_method :patron
    end

    allow(view).to receive(:patron).and_return(mock_patron)
  end

  it 'shows the patron\'s name' do
    render
    expect(rendered).to have_content 'Jane Doe'
  end

  it 'sets the patron\'s key' do
    render
    expect(rendered).to have_selector('[@data-patron-key="12345"]')
  end
end
