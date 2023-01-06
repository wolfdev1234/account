# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Bib, type: :model do
  let(:bib_with_holdables) { build(:bib_with_holdables) }

  it 'has an author' do
    expect(bib_with_holdables.author).to be 'Hill Street blues (Television program)'
  end

  it 'has a title' do
    expect(bib_with_holdables.title).to be 'Hill Street blues. The complete series'
  end

  it 'has a call list' do
    expect(bib_with_holdables.call_list.count).to be 8
  end
end
