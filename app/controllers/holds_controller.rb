# frozen_string_literal: true

class HoldsController < ApplicationController
  before_action :set_cache_headers
  before_action :authenticate_user!
  before_action :check_for_blanks!, only: :create
  before_action :unless_maintenance_mode, only: :new
  rescue_from NewHoldException, with: :deny_new
  rescue_from HoldCreateException, with: :deny_create

  # Render patron holds
  #
  # GET /holds
  def index
    @patron_key = current_user.patron_key
    ws_args = { patron_key: @patron_key, session_token: current_user.session_token }
    ViewHoldsJob.perform_later **ws_args

    render
  end

  # Handles form submission for changing holds in Symphony
  #
  # PATCH /holds
  # PUT /holds
  def batch_update
    params['hold_list']&.each do |hold_key|
      ws_args = { hold_key: hold_key, session_token: current_user.session_token }

      if params[:pickup_library].present?
        ChangePickupLibraryJob.perform_later **ws_args, pickup_library: params[:pickup_library]
      end

      if params[:pickup_by_date].present?
        ChangePickupByDateJob.perform_later **ws_args, pickup_by_date: params[:pickup_by_date]
      end
    end

    render plain: 'Update scheduled', status: :ok
  end

  # Prepares the form for creating a new hold
  #
  # GET /holds/new
  def new
    raise NewHoldException, 'Error' if params[:catkey].blank?

    form_builder = PlaceHoldForm::Builder.new(catkey: params[:catkey],
                                              user_token: current_user.session_token,
                                              client: symphony_client,
                                              library: patron.library)
    @place_hold_form_params = form_builder.generate

    raise NewHoldException, 'Error' if @place_hold_form_params.blank?
  end

  # Handles placing holds
  #
  # POST /holds
  def create
    PlaceHoldsJob.perform_later barcodes: barcodes,
                                session_token: current_user.session_token,
                                patron_key: current_user.patron_key,
                                catkey: params['catkey'],
                                pickup_library: params['pickup_library'],
                                pickup_by_date: params['pickup_by_date']

    redirect_to result_path
  end

  # Handles place hold response
  #
  # GET /holds/result
  def result
    if request.referer && URI(request.referer).path == '/holds/new'
      render
    else
      redirect_to '/not_found'
    end
  end

  # Handles form submission for canceling holds in Symphony
  #
  # DELETE /holds
  def batch_destroy
    params['hold_list']&.each do |hold_key|
      ws_args = { hold_key: hold_key, session_token: current_user.session_token }

      CancelHoldJob.perform_later(**ws_args)
    end

    render plain: 'Deletion scheduled', status: :ok
  end

  private

    def check_for_blanks!
      return unless barcodes.blank? || params['pickup_library'].blank? || params['pickup_by_date'].blank?

      raise HoldCreateException, 'Error'
    end

    def deny_new
      flash[:error] = if params['catkey'].blank?
                        t 'myaccount.hold.new_hold.catkey_missing'
                      else
                        t 'myaccount.hold.new_hold.error_html'
                      end

      redirect_to summaries_path
    end

    def deny_create
      flash[:error] = if barcodes.blank?
                        t 'myaccount.hold.place_hold.select_volumes'
                      elsif params['pickup_library'].blank?
                        t 'myaccount.hold.place_hold.select_library'
                      else
                        t 'myaccount.hold.place_hold.select_date'
                      end

      redirect_to new_hold_path(catkey: params[:catkey])
    end

    def barcodes
      [params['barcodes']].flatten.compact
    end
end
