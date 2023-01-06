# frozen_string_literal: true

module FinesHelper
  def fine_title_display(fine:)
    (render BibItemComponent.new(bibitem: fine) unless fine.catkey.nil?) || fine.title
  end
end
