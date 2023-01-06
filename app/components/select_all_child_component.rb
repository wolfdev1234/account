# frozen_string_literal: true

class SelectAllChildComponent < ViewComponent::Base
  def initialize(key:, target_keyword:, name: nil)
    @name = name || "#{target_keyword}_list[]"
    @key = key
    @id = "#{@name}[#{key}]"
    @target_keyword = target_keyword
  end

  def render?
    !Settings.maintenance_mode
  end

  private

    attr_reader :name, :target_keyword, :key, :id
end
