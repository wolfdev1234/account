# frozen_string_literal: true

class PlaceHoldCheckboxWrapperComponent < ViewComponent::Base
  def initialize(volumetric_calls: nil)
    @volumetric_calls = volumetric_calls
  end

  def render?
    volumetric_calls.present?
  end

  private

    attr_reader :volumetric_calls
end
