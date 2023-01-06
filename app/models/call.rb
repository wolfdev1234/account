# frozen_string_literal: true

# Model for call-level information in Symphony
class Call
  include BibRecord
  attr_reader :record, :items

  def initialize(record:)
    @record = record
    @items = item_list.map { |i| Item.new i }
  end

  def item_list
    fields['itemList']
  end

  def volumetric
    fields['volumetric']
  end

  private

    def fields
      record['fields']
    end
end
