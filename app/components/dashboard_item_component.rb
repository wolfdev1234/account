# frozen_string_literal: true

class DashboardItemComponent < ViewComponent::Base
  def initialize(model:, count:, count_term: nil, currency: nil, items: nil)
    @model = model
    @count = count
    @currency = currency
    @count_term = count_term
    @items = items
  end

  def card_body
    return nil if @items.nil?

    facts = @items.map do |item|
      tag.li "#{item[:count]}  #{item[:label]}"
    end.join

    tag.ul facts, escape_attributes: false
  end

  def total
    return @count unless @currency

    number_to_currency(@count)
  end

  def item_link
    url = url_for(controller: @model.to_s.downcase, action: 'index')

    link_to "See all #{@model}", url, class: 'btn btn-primary float-right deflatten'
  end

  def render?
    @count&.positive?
  end

  private

    attr_reader :model, :count_term
end
