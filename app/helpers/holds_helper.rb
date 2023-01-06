# frozen_string_literal: true

module HoldsHelper
  def render_queue_position(hold)
    return hold.queue_position.ordinalize unless hold.queue_position.nil?

    'Unknown'
  end

  def render_hold_date(hold, date_field:)
    return l(hold.send(date_field), format: :short) if hold.send(date_field)

    'Never expires'
  end

  def render_status(hold)
    case hold.status_code
    when 'SUSPENDED'
      pretext = tag.em 'Suspended from'
      unless hold.suspend_end_date.nil?
        return pretext + ": #{l(hold.suspend_begin_date, format: :short)} - #{l(hold.suspend_end_date, format: :short)}"
      end

      'Inactive'
    else
      'Active'
    end
  end

  def render_pickup_libraries(selected)
    pickup_libraries = Hold::PICKUP_LOCATION_REQUESTED

    if selected.blank? || !pickup_libraries.value?(selected.to_sym)
      selected = ''
      default_choice = t('myaccount.hold.update_pickup.pickup_choose_text')
      pickup_libraries = Hash[default_choice, ''].merge(Hold::PICKUP_LOCATION_REQUESTED)
    end

    options_for_select(pickup_libraries, disabled: '', selected: selected)
  end

  def default_pickup_by_date(make_default: false)
    return '' unless make_default

    DateTime.now.+(14.days).strftime('%Y-%m-%d')
  end

  def minimum_pickup_by_date
    DateTime.now.strftime('%Y-%m-%d')
  end
end
