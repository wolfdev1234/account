# frozen_string_literal: true

# Model for the Checkouts page
class Checkout
  include BibRecord

  attr_reader :record

  def initialize(record)
    @record = record
  end

  def key
    record['key']
  end

  def status
    fields['status']
  end

  def status_human
    return '' unless overdue?

    claims_returned? ? 'Claims Returned' : 'Overdue'
  end

  def due_date
    fields['dueDate'] && Time.zone.parse(fields['dueDate'])
  end

  def due_date_human
    format_due_date due_date
  end

  def recall_due_date_human
    format_due_date recall_due_date
  end

  def recalled?
    recalled_date.present?
  end

  def claims_returned?
    claims_returned_date.present?
  end

  def overdue?
    fields['overdue']
  end

  def accrued
    fields.dig('estimatedOverdueAmount', 'amount').to_d
  end

  def renewal_count
    fields['renewalCount'] || 0
  end

  private

    def fields
      record['fields']
    end

    def recalled_date
      fields['recalledDate'] && Time.zone.parse(fields['recalledDate'])
    end

    def recall_due_date
      fields['recallDueDate'] && Time.zone.parse(fields['recallDueDate'])
    end

    def claims_returned_date
      fields['claimsReturnedDate'] && Time.zone.parse(fields['claimsReturnedDate'])
    end

    def format_due_date(date)
      return unless date

      return I18n.l(date, format: :long) unless I18n.l(date, format: :time_only) == '11:59pm'

      I18n.l(date, format: :short)
    end
end
