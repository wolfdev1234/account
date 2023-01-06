# frozen_string_literal: true

class FinesController < ApplicationController
  before_action :authenticate_user!

  # Render patron fines
  #
  # GET /fines
  def index
    @fines = fines
    @total_owed = @fines&.sum(&:owed_amount)
  end

  private

    def fines
      @fines ||= patron.fines
    end

    def item_details
      { blockList: true }
    end
end
