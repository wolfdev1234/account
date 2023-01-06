# frozen_string_literal: true

class CheckoutsController < ApplicationController
  include ActionView::Helpers::TagHelper
  before_action :set_cache_headers
  before_action :authenticate_user!

  # Render a list of checkouts and renewals for patron
  #
  # GET /checkouts
  def index
    ws_args = { patron_key: current_user.patron_key, session_token: current_user.session_token }
    ViewCheckoutsJob.perform_later **ws_args

    @patron_key = current_user.patron_key
    render
  end

  # Handles form submission for batch checkout renewal requests
  #
  # PATCH /checkouts/batch
  def batch_update
    checkouts_to_renew&.each do |checkout|
      ws_args = { resource: '/catalog/item',
                  item_key: checkout,
                  session_token: current_user.session_token }
      RenewCheckoutJob.perform_later(**ws_args)
    end

    render plain: 'Renew', status: :ok
  end

  private

    def checkouts_to_renew
      params['renewal_list']
    end

    def deny_access
      flash[:error] = 'An unexpected error has occurred'

      redirect_to checkouts_path
    end
end
