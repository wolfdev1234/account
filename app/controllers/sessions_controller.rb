# frozen_string_literal: true

class SessionsController < ApplicationController
  # Render the application home page
  #
  # GET /
  def index
    if request.env['warden'].authenticate(:library_id) == nil
      # Run it through webaccess and have it come back to this same method
      authenticate_webaccess
    end

    if current_user?
      original_fullpath = session[:original_fullpath]
      session.delete(:original_fullpath)

      return redirect_to original_fullpath if original_fullpath.present?

      redirect_to summaries_url
    else
      # if the symphony client returns no user we might want to redirect to a page that
      # says that they don't have a record?
      redirect_to '/500'
    end
  end

  # Handle user logout
  #
  # GET /logout
  def destroy
    request.env['warden'].logout
  end
end
