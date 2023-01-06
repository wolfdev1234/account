# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Errors', type: :request do
  context 'with unauthenticated user' do
    it 'goes to the application root' do
      get '/bad_route'

      expect(response).to have_http_status(:not_found)
    end
  end

  context 'with an authenticated request' do
    let(:mock_user) { 'patron2' }

    before do
      login_permanently_as username: 'PATRON2', patron_key: mock_user
    end

    after do
      Warden::Manager._on_request.clear
    end

    context 'when GET to errors route' do
      describe 'not found' do
        before { get '/bad_route' }

        it 'has http status 404' do
          expect(response).to have_http_status(:not_found)
        end

        it 'redirects to customized not_found error page' do
          expect(response.body).to include '<h4>The page you were looking for doesn\'t exist.</h4>'
        end
      end

      describe 'not found with formats other than html' do
        before { get '/bad_route.xml' }

        it 'has http status 404' do
          expect(response).to have_http_status(:not_found)
        end

        it 'redirects to customized not_found error page' do
          expect(response.body).to include '<h4>The page you were looking for doesn\'t exist.</h4>'
        end
      end

      describe 'internal server error' do
        before { get '/500' }

        it 'has http status 500' do
          expect(response).to have_http_status(:internal_server_error)
        end

        it 'redirects to customized internal_server_error error page' do
          expect(response.body).to include '<h4>We\'re sorry, but something went wrong.</h4>'
        end
      end
    end

    context 'when POST to errors route' do
      describe 'not found' do
        before { post '/404' }

        it 'has http status 404' do
          expect(response).to have_http_status(:not_found)
        end

        it 'redirects to customized not_found error page' do
          expect(response.body).to include '<h4>The page you were looking for doesn\'t exist.</h4>'
        end
      end

      describe 'internal server error' do
        before { post '/500' }

        it 'has http status 500' do
          expect(response).to have_http_status(:internal_server_error)
        end

        it 'redirects to customized internal_server_error error page' do
          expect(response.body).to include '<h4>We\'re sorry, but something went wrong.</h4>'
        end
      end
    end
  end
end
