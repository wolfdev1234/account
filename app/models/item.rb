# frozen_string_literal: true

# Model for item-level information in Symphony
class Item
  include BibRecord

  attr_reader :record

  def initialize(record)
    @record = record
  end

  def barcode
    fields['barcode']
  end

  def current_location
    fields.dig('currentLocation', 'key')
  end

  private

    def fields
      record['fields']
    end

    def item
      record['fields']
    end
end
