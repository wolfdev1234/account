# frozen_string_literal: true

class ErrorsController < ApplicationController
  # for users that are not able to auth, this before action was causing some heartache.
  # perhaps there's a better way to do it. but for errors, i don't think it's unresonable to be
  # unauthenticated
  # before_action :authenticate_user!

  def not_found
    respond_to do |format|
      format.any { render status: 404, formats: :html, content_type: 'text/html' }
    end
  end

  def internal_server_error
    render status: 500
  end
end
