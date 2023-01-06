# frozen_string_literal: true

# Model for holds in Symphony
class Hold
  include BibRecord

  PICKUP_LOCATION_REQUESTED = Settings.pickup_locations.to_h.invert
  PICKUP_LOCATION_ACTUAL = Settings.pickup_locations_actual.to_h

  attr_reader :record

  def initialize(record)
    @record = record
  end

  def key
    record['key']
  end

  def patron_key
    fields['patron']['key']
  end

  def ready_for_pickup?
    status_code == 'BEING_HELD'
  end

  def pickup_library_human
    PICKUP_LOCATION_ACTUAL[pickup_library_code.to_sym] || pickup_library_code
  end

  def expiration_date
    Time.zone.parse fields['expirationDate'] if fields['expirationDate']
  end

  def fill_by_date
    Time.zone.parse fields['fillByDate'] if fields['fillByDate']
  end

  def queue_position
    fields['queuePosition']
  end

  def suspend_begin_date
    Time.zone.parse fields['suspendBeginDate'] if fields['suspendBeginDate']
  end

  def suspend_end_date
    Time.zone.parse fields['suspendEndDate'] if fields['suspendEndDate']
  end

  def status_code
    fields['status']
  end

  private

    def fields
      record['fields']
    end

    def pickup_library_code
      fields.dig('pickupLibrary', 'key') || fields.dig('library', 'key') || 'NOTFOUND'
    end
end
