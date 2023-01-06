# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Ask a librarian', type: :feature do
  let(:mock_user) { 'patron2' }

  before do
    login_as username: 'PATRON2', patron_key: mock_user
  end

  describe 'side tab widget', js: true do
    it 'shows up on the homepage' do
      visit summaries_path
      expect(page).to have_css('button[class^="libchat"]')
    end
  end
end
