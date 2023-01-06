# frozen_string_literal: true

# Model for bib-level information in Symphony, it's basically a hold request factory
class Bib
  include BibRecord
  attr_reader :record

  def initialize(record)
    @record = record
  end

  def call_list
    bib&.dig 'callList'
  end

  private

    def bib
      @record['fields']
    end
end
