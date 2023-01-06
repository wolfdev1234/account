# frozen_string_literal: true

class GenericValueWithLabelComponent < ViewComponent::Base
  def initialize(label:, value:)
    @label = label
    @value = value
  end

  def render?
    @value.present?
  end

  private

    attr_reader :label, :value
end
