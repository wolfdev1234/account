# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Hold, type: :model do
  subject(:hold) { build(:hold) }

  it 'has a key' do
    hold.record['key'] = '1'
    expect(hold.key).to eq '1'
  end

  it 'has a patron key' do
    hold.record['fields']['patron']['key'] = '123'
    expect(hold.patron_key).to eq '123'
  end

  context 'when the item is ready for pickup' do
    it 'is ready for pickup' do
      hold.record['fields']['status'] = 'BEING_HELD'
      expect(hold).to be_ready_for_pickup
    end
  end

  it 'has a title' do
    hold.record['fields']['bib']['fields']['title'] = 'A wonderful title'
    expect(hold.title).to eq 'A wonderful title'
  end

  it 'has an author' do
    hold.record['fields']['bib']['fields']['author'] = 'A wonderful author'
    expect(hold.author).to eq 'A wonderful author'
  end

  it 'has a catkey' do
    hold.record['fields']['bib']['key'] = '123456'
    expect(hold.catkey).to eq '123456'
  end

  it 'has a pickup library set that can be understood by humans' do
    hold.record['fields']['pickupLibrary']['key'] = 'UP-PAT'
    expect(hold.pickup_library_human).to eq 'Pattee and Paterno Library - Commons Services Desk'
  end

  it 'has a nil pickup library set that can be understood by humans' do
    hold.record['fields']['pickupLibrary']['key'] = nil
    expect(hold.pickup_library_human).to eq 'The system is experiencing difficulty displaying '\
                                              "this item's pickup location"
  end

  it 'has a queue position' do
    hold.record['fields']['queuePosition'] = 27
    expect(hold.queue_position).to eq 27
  end

  it 'has an expiration date' do
    hold.record['fields']['expirationDate'] = '2525/01/01'
    expect(hold.expiration_date.strftime('%m/%d/%Y')).to eq '01/01/2525'
  end

  it 'has a fill by date' do
    hold.record['fields']['fillByDate'] = '2524/01/01'
    expect(hold.fill_by_date.strftime('%m/%d/%Y')).to eq '01/01/2524'
  end

  it 'has a suspend begin date' do
    hold.record['fields']['suspendBeginDate'] = '2523/01/01'
    expect(hold.suspend_begin_date.strftime('%m/%d/%Y')).to eq '01/01/2523'
  end

  it 'has a suspend end date' do
    hold.record['fields']['suspendEndDate'] = '2522/01/01'
    expect(hold.suspend_end_date.strftime('%m/%d/%Y')).to eq '01/01/2522'
  end

  it 'has a status' do
    hold.record['fields']['status'] = 'ACTIVE'
    expect(hold.status_code).to eq 'ACTIVE'
  end

  it 'has a bib summary' do
    hold.record['fields']['bib']['fields']['title'] = 'A wonderful title'
    hold.record['fields']['item']['fields']['call']['fields']['dispCallNumber'] = 'ABC123'

    expect(hold.bib_summary).to eq 'A wonderful title (ABC123)'
  end
end
