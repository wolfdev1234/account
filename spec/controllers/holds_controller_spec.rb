# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HoldsController, type: :controller do
  let(:mock_patron) { instance_double(Patron, barcode: '123456789', library: 'UP_PAT') }
  let(:holds) do
    [
      instance_double(Hold, key: '1', ready_for_pickup?: true, title: 'Some Great Book', call_number: 'ABC123',
                            bib_summary: 'Some Great Book (ABC123)'),
      instance_double(Hold, key: '2', ready_for_pickup?: false, title: 'Some Good Book', call_number: 'ABC124',
                            bib_summary: 'Some Good Book (ABC124)')
    ]
  end

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
        patron_key: '1234567',
        session_token: 'e0b5e1a3e86a399112b9eb893daeacfd' }
    end
    let(:mock_client) { instance_double(SymphonyClient) }

    before do
      warden.set_user(user)
      allow(SymphonyClient).to receive(:new).and_return(mock_client)
      allow(mock_client).to receive(:ping?).and_return(true)
      allow(mock_patron).to receive(:holds).and_return(holds)
    end

    describe '#index' do
      before do
        allow(ViewHoldsJob).to receive(:perform_later)
      end

      it 'sends a job to ViewHoldsJob' do
        get :index

        expect(ViewHoldsJob).to have_received(:perform_later)
      end

      it 'renders the index template' do
        get :index

        expect(response).to render_template 'index'
      end
    end

    describe '#new' do
      let(:form_builder) { instance_double(PlaceHoldForm::Builder) }

      form_params = {
        catkey: '1',
        title: 'How to Eat More Pizza',
        author: 'Samantha Smith',
        volumetric_calls: [],
        barcode: '2'
      }

      before do
        allow(PlaceHoldForm::Builder).to receive(:new).and_return(form_builder)
        allow(form_builder).to receive(:generate).and_return(form_params)
      end

      it 'sends the form parameters to the view' do
        get :new, params: { catkey: 1 }

        expect(assigns(:place_hold_form_params)).to eq(form_params)
      end

      context 'when catkey param is missing' do
        it 'sets a flash error message' do
          get :new, params: {}

          expect(flash[:error]).to eq I18n.t('myaccount.hold.new_hold.catkey_missing')
        end

        it 'redirects to the summaries' do
          get :new, params: {}

          expect(response).to redirect_to summaries_path
        end
      end

      context 'when user tries with a non holdable record' do
        form_params = {}

        it 'sets a flash error message' do
          get :new, params: { catkey: 1 }

          expect(flash[:error]).to eq I18n.t('myaccount.hold.new_hold.error_html')
        end

        it 'redirects to the summaries' do
          get :new, params: { catkey: 1 }

          expect(response).to redirect_to summaries_path
        end
      end

      context 'when the site is in maintenance mode' do
        after do
          Settings.maintenance_mode = false
        end

        it 'returns redirects to the homepage' do
          Settings.maintenance_mode = true

          put :new, params: { catkey: 1 }

          expect(response).to redirect_to root_path
        end
      end
    end

    describe '#create' do
      let(:place_hold_params) {
        { catkey: '1',
          barcodes: ['1'],
          pickup_library: 'UP_PAT',
          pickup_by_date: '2050-02-02' }
      }

      before do
        allow(PlaceHoldsJob).to receive(:perform_later)
      end

      context 'when provided needed params' do
        before do
          post :create, params: place_hold_params
        end

        it 'sends a job to PlaceHoldsJob' do
          expect(PlaceHoldsJob).to have_received(:perform_later)
        end

        it 'redirects to results' do
          expect(response).to redirect_to('/holds/result')
        end
      end

      context 'when placing hold with missing pickup location' do
        before do
          post :create, params: place_hold_params.except(:pickup_library)
        end

        it 'redirects to the new hold page' do
          expect(response).to redirect_to new_hold_path(catkey: '1')
        end

        it 'sets a flash error message' do
          expect(flash[:error]).to match(/choose a pickup location/)
        end
      end

      context 'when placing hold with missing barcode params' do
        before do
          post :create, params: place_hold_params.except(:barcodes)
        end

        it 'redirects to the new hold page' do
          expect(response).to redirect_to new_hold_path(catkey: '1')
        end

        it 'sets a flash error message' do
          expect(flash[:error]).to match(/select a volume/)
        end
      end

      context 'when placing hold with missing not needed after date' do
        before do
          post :create, params: place_hold_params.except(:pickup_by_date)
        end

        it 'redirects to the new hold page' do
          expect(response).to redirect_to new_hold_path(catkey: '1')
        end

        it 'sets a flash error message' do
          expect(flash[:error]).to match(/choose a not needed after date/)
        end
      end
    end

    describe '#result' do
      context 'when not redirected from /holds/new' do
        it 'redirects to the summary page' do
          get :result

          expect(response).to redirect_to '/not_found'
        end
      end
    end

    describe '#batch_update' do
      context 'when pickup library is specified' do
        before do
          allow(ChangePickupLibraryJob).to receive(:perform_later)
          allow(ChangePickupByDateJob).to receive(:perform_later)
        end

        it 'sends a job to ChangePickupLibraryJob' do
          patch :batch_update, params: { hold_list: ['3911148'], pickup_library: 'ALTOONA' }

          expect(ChangePickupLibraryJob).to have_received(:perform_later)
        end

        it 'send a job to ChangePickupByDateJob' do
          patch :batch_update, params: { hold_list: ['3911148'], pickup_by_date: '2001-01-10' }

          expect(ChangePickupByDateJob).to have_received(:perform_later)
        end
      end
    end

    describe '#batch_destroy' do
      before do
        allow(CancelHoldJob).to receive(:perform_later)
      end

      it 'sends a job to CancelHoldJob' do
        delete :batch_destroy, params: { hold_list: ['3911148'] }

        expect(CancelHoldJob).to have_received(:perform_later)
      end
    end
  end
end
