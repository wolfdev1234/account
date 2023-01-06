# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RedisJobsController, type: :controller do
  before do
    Redis.current.set 3911148, "hold_id": '3911148',
                               "result": 'success',
                               "new_value": 'Brandywine',
                               "new_value_id": 'BRANDYWINE'
  end

  after do
    Redis.current.del 3911148
  end

  describe '#show' do
    it 'retrieves and renders json form of the job' do
      get :show, params: { id: 3911148, format: 'json' }

      expect(response.body).to include 'BRANDYWINE'
    end
  end

  describe '#destroy' do
    it 'sends a delete message to the redis client and returns the results' do
      delete :destroy, params: { id: 3911148 }

      expect(response.body).to eq '1'
    end
  end
end
