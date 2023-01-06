# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Call, type: :model do
  subject(:call) { build(:call) }

  it 'has a item list' do
    expect(call.item_list.count).to be 2
  end

  it 'has a volumetric' do
    call.record['fields']['volumetric'] = 'no. 1'
    expect(call.volumetric).to eq 'no. 1'
  end
end
