# frozen_string_literal: true

class BibItemComponent < ViewComponent::Base
  CATALOG_URL = Rails.application.config.catalog_url
  TYPES_NOT_LINKED = Rails.application.config.unlinked_types

  def initialize(bibitem:)
    @title = bibitem.title
    @catkey = bibitem.catkey
    @type_human = bibitem.item_type_human
    @type_code = bibitem.item_type_code
    @author = bibitem.author
    @call_number = bibitem.call_number
    @shadowed = bibitem.shadowed?
  end

  def processed_title
    return title if author.blank?

    "#{title} / #{author}"
  end

  def final_title
    link_to_unless unlinked?, processed_title, catalog_url
  end

  def catalog_url
    CATALOG_URL + catkey
  end

  def render?
    catkey
  end

  private

    attr_reader :title, :catkey, :type_human, :type_code, :author, :call_number

    def unlinked?
      TYPES_NOT_LINKED.include?(type_code) || @shadowed
    end
end
