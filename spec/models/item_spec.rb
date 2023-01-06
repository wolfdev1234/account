# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item, type: :model do
  subject(:item) { build(:item) }

  let(:redis_instance) { instance_double(Redis) }

  before do
    allow(Redis).to receive(:new).and_return(redis_instance)
    allow(redis_instance).to receive(:get).and_return(nil, ITEM_TYPE_MAPPING.to_json)
    allow(redis_instance).to receive(:setex)

    stub_request(:get, 'https://example.com/symwsbc/policy/itemType/simpleQuery?includeFields=displayName,description&key=*')
      .to_return(status: 200, body: ITEM_TYPE_MAPPING.to_json, headers: {})
  end

  it 'has a catkey' do
    item.record['fields']['bib']['key'] = '476022'
    expect(item.catkey).to eq '476022'
  end

  it 'has a author' do
    item.record['fields']['bib']['fields']['author'] = 'No Author'
    expect(item.author).to eq 'No Author'
  end

  it 'has a title' do
    item.record['fields']['bib']['fields']['title'] = 'National review'
    expect(item.title).to eq 'National review'
  end

  it 'has a format' do
    item.record['fields']['itemType']['key'] = 'PERIODICAL'
    expect(item.item_type_human).to eq 'Bound Journal'
  end

  it 'has a call number' do
    item.record['fields']['call']['fields']['dispCallNumber'] = 'AP2.N3545 v.17 no.28-52 1965'
    expect(item.call_number).to eq 'AP2.N3545 v.17 no.28-52 1965'
  end

  it 'has a barcode' do
    item.record['fields']['barcode'] = '000068740887'
    expect(item.barcode).to eq '000068740887'
  end

  it 'has a current location' do
    item.record['fields']['currentLocation']['key'] = 'CATO-2'
    expect(item.current_location).to eq 'CATO-2'
  end
end
