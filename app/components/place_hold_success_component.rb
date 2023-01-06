# frozen_string_literal: true

class PlaceHoldSuccessComponent < ViewComponent::Base
  def initialize(result:)
    @placed_hold = result[:placed_hold]
  end

  def pickup_library
    @placed_hold.pickup_library_human
  end

  def fill_by_date
    l(placed_hold.fill_by_date, format: :short)
  end

  def render?
    placed_hold.present?
  end

  private

    attr_reader :placed_hold
end
