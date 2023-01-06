# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LendingPolicyController do
  let(:mock_patron) { instance_double(Patron, eligible_for_wage_garnishment?: false) }
  let(:mock_client) { instance_double(SymphonyClient, ping?: true) }

  context 'with unauthenticated user' do
    it 'goes to the application root' do
      get(:show)
      expect(response).to redirect_to root_url
    end
  end

  context 'with an authenticated request' do
    let(:user) {
      instance_double(User,
                      username: 'zzz123',
                      name: 'Zeke',
                      patron_key: '1234567',
                      session_token: 'e0b5e1a3e86a399112b9eb893daeacfd')
    }

    before do
      warden.set_user(user)
      allow(controller).to receive(:patron).and_return(mock_patron)
      allow(controller).to receive(:current_user).and_return(user)
      allow(SymphonyClient).to receive(:new).and_return(mock_client)
      allow(mock_client).to receive(:accept_lending_policy).and_return(double(status: 200))
    end

    describe 'GET #show' do
      it 'renders the show template' do
        expect(get(:show)).to render_template 'show'
      end
    end

    describe 'POST #accept' do
      context 'when the patron is not eligible for wage garnishment' do
        it 'renders the thank you template' do
          expect(post(:accept)).to redirect_to lending_policy_thank_you_path
        end
      end

      context 'when the patron is eligible for wage garnishment' do
        let(:mock_patron) { instance_double(Patron, eligible_for_wage_garnishment?: true) }

        context 'when the request is successful' do
          it 'accepts the lending policy' do
            post(:accept)

            expect(mock_client).to have_received(:accept_lending_policy)
              .with(patron: mock_patron, session_token: user.session_token)
          end

          it 'renders the thank you template' do
            expect(post(:accept)).to redirect_to lending_policy_thank_you_path
          end
        end

        context 'when the request is not successful' do
          before do
            allow(mock_client).to receive(:accept_lending_policy)
              .and_return(double(status: 500))
          end

          it 'renders the error template' do
            expect(post(:accept)).to redirect_to lending_policy_error_path
          end
        end
      end
    end
  end
end
