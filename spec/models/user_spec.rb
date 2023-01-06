# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  subject(:user) { described_class.new(user_attributes) }

  let(:user_attributes) { { username: 'user_id', name: 'Name', patron_key: '123', session_token: '123' } }

  it 'has attributes' do
    expect(user).to have_attributes(user_attributes)
  end
end
