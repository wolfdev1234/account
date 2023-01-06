# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Fine do
  subject(:fine) { build(:fine) }

  it 'tallies all the fees into a total amount owed' do
    fine.record['fields']['owed']['amount'] = '12.00'
    expect(fine.owed_amount).to eq 12
  end

  it 'has a reason' do
    fine.record['fields']['block']['fields']['description'] = 'Recall overdue'
    expect(fine.status_human).to eq 'Recall overdue'
  end

  it 'has a billed date' do
    fine.record['fields']['billDate'] = '2019-10-08'
    expect(fine.bill_date.strftime('%m/%d/%Y')).to eq '10/08/2019'
  end

  it 'has a customized title for Miscellaneous Charges' do
    fine.record['fields']['item'] = nil
    expect(fine.title).to eq 'Not associated with an item'
  end
end
