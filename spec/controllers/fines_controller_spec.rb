# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FinesController do
  let(:mock_patron) { instance_double(Patron) }
  let(:fines) { [instance_double(Fine, owed_amount: 0.50), instance_double(Fine, owed_amount: 0.50)] }

  before do
    allow(controller).to receive(:patron).and_return(mock_patron)
  end

  context 'with unauthenticated user' do
    it 'goes to the application root' do
      get(:index)
      expect(response).to redirect_to root_url
    end
  end

  context 'with an authenticated request' do
    let(:user) do
      { username: 'zzz123',
        name: 'Zeke',
        patron_key: '1234567' }
    end

    let(:mock_client) do
      instance_double(SymphonyClient, ping?: true)
    end

    before do
      warden.set_user(user)
      allow(SymphonyClient).to receive(:new).and_return(mock_client)
      allow(mock_patron).to receive(:fines).and_return(fines)
    end

    it 'sends the right item details to the web service' do
      item_details = controller.send(:item_details)

      expect(item_details).to eq blockList: true
    end

    it 'renders the index template' do
      get(:index)

      expect(response).to render_template 'index'
    end

    it 'assigns a list of fines' do
      get(:index)

      expect(assigns(:fines)).to eq fines
    end

    it 'assigns a fine total' do
      get(:index)

      expect(assigns(:total_owed)).to eq 1
    end
  end
end
