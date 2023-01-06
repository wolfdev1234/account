# frozen_string_literal: true

class Fine
  include BibRecord

  attr_reader :record

  NO_TITLE_TEXT = 'Not associated with an item'

  def initialize(record)
    @record = record
  end

  def title
    bib['title'] || NO_TITLE_TEXT
  end

  def owed_amount
    fields['owed']['amount'].to_d
  end

  def status_human
    fields.dig('block', 'fields', 'description')
  end

  def bill_date
    Time.zone.parse(fields['billDate']) if fields['billDate']
  end

  private

    def fields
      record['fields']
    end
end
