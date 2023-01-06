# frozen_string_literal: true

class RedisJobsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    job_status = Redis.current.get(params[:id]) || { result: :not_found }
    render json: job_status
  end

  def destroy
    status = Redis.current.del(params[:id]) || { result: :not_found }
    render json: status
  end
end
