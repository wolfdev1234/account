# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Summaries', type: :feature do
  # patron1 below has 1 hold ready for pick and 4 holds not yet ready for pickup
  let(:mock_user) { 'patron1' }

  before do
    login_permanently_as username: 'PATRON1', patron_key: mock_user
  end

  after do
    Warden::Manager._on_request.clear
  end

  describe 'the summaries page', js: true do
    it 'is accessible' do
      visit summaries_path

      expect(page).to be_accessible
    end
  end
end
