# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SymphonyClient do
  subject(:client) { described_class.new }

  let(:user) {
    instance_double(User,
                    username: 'zzz123',
                    name: 'Zeke',
                    patron_key: '1234567',
                    session_token: 'e0b5e1a3e86a399112b9eb893daeacfd')
  }

  before do
    allow(User).to receive(:new).and_return(user)
  end

  describe '#login' do
    before do
      stub_request(:post, "#{Settings.symws.url}/user/staff/login")
        .with(body: Settings.symws.login_params.to_h,
              headers: Settings.symws.default_headers)
        .to_return(body: { sessionToken: user.session_token }.to_json)

      search_headers = Settings.symws.default_headers
        .to_h.merge('X-Sirs-Sessiontoken': 'e0b5e1a3e86a399112b9eb893daeacfd')

      stub_request(:get, "#{Settings.symws.url}/user/patron/search")
        .with(headers: search_headers,
              query: hash_including(includeFields: '*'))
        .to_return(status: 200,
                   body: { result: [{ key: Settings.symws.patron_key, fields: '' }] }.to_json)
    end

    it 'logs the user in to symphony' do
      expect(client.login('fake_user', 'some_password')[1]).to eq('e0b5e1a3e86a399112b9eb893daeacfd')
    end
  end

  describe '#get_patron_record' do
    before do
      stub_request(:get, "#{Settings.symws.url}/user/patron/search")
        .with(headers: Settings.symws.default_headers.to_h.merge('X-Sirs-Sessiontoken': 'token'),
              query: hash_including(includeFields: '*'))
        .to_return(status: 200,
                   body: { result: [{ key: Settings.symws.patron_key, fields: '' }] }.to_json)
    end

    it 'returns the user' do
      expect(client.get_patron_record('user', 'token')).to include 'patronKey' => 'some_patron_key'
    end
  end

  describe '#ping?' do
    let(:auth_response) { { status: 200 } }

    before do
      stub_request(:get, "#{Settings.symws.url}/user/patron/key/1234567")
        .with(query: hash_including(includeFields: 'key'))
        .to_return(auth_response)
    end

    it 'validates the user\'s session against symphony' do
      expect(client).to be_ping(user)
    end

    context 'with a stale session' do
      let(:auth_response) { { status: 401 } }

      it 'cannot validate the user\'s session against symphony' do
        expect(client).not_to be_ping(user)
      end
    end
  end

  describe '#patron_info' do
    before do
      stub_request(:get, "#{Settings.symws.url}/user/patron/key/1234567")
        .with(query: hash_including(includeFields: match(/\*/)))
        .to_return(body: { key: '1234567' }.to_json)
    end

    it 'authenticates the user against symphony' do
      expect(client.patron_info(patron_key: user.patron_key,
                                session_token: user.session_token)).to include 'key' => '1234567'
    end

    context 'when requesting item details' do
      it 'requests the item details for checkouts' do
        client.patron_info(patron_key: user.patron_key,
                           session_token: user.session_token,
                           item_details: { circRecordList: true })

        expect(WebMock).to have_requested(:get, "#{Settings.symws.url}/user/patron/key/1234567")
          .with(query: hash_including(includeFields: match(/circRecordList{.*,item{.*}}/)))
        expect(WebMock).to have_requested(:get, "#{Settings.symws.url}/user/patron/key/1234567")
          .with(query: hash_excluding(includeFields: match(/blockList/)))
        expect(WebMock).to have_requested(:get, "#{Settings.symws.url}/user/patron/key/1234567")
          .with(query: hash_excluding(includeFields: match(/holdRecordList/)))
      end

      it 'requests the item details for holds' do
        client.patron_info(patron_key: user.patron_key,
                           session_token: user.session_token,
                           item_details: { holdRecordList: true })

        expect(WebMock).to have_requested(:get, "#{Settings.symws.url}/user/patron/key/1234567")
          .with(query: hash_including(includeFields: match(/holdRecordList{.*,item{.*}}/)))
        expect(WebMock).to have_requested(:get, "#{Settings.symws.url}/user/patron/key/1234567")
          .with(query: hash_excluding(includeFields: match(/circRecordList/)))
        expect(WebMock).to have_requested(:get, "#{Settings.symws.url}/user/patron/key/1234567")
          .with(query: hash_excluding(includeFields: match(/holdRecordList/)))
      end

      it 'requests the item details for fines' do
        client.patron_info(patron_key: user.patron_key,
                           session_token: user.session_token,
                           item_details: { blockList: true })

        expect(WebMock).to have_requested(:get, "#{Settings.symws.url}/user/patron/key/1234567")
          .with(query: hash_including(includeFields: match(/blockList{.*,item{.*}}/)))
        expect(WebMock).to have_requested(:get, "#{Settings.symws.url}/user/patron/key/1234567")
          .with(query: hash_excluding(includeFields: match(/circRecordList/)))
        expect(WebMock).to have_requested(:get, "#{Settings.symws.url}/user/patron/key/1234567")
          .with(query: hash_excluding(includeFields: match(/holdRecordList/)))
      end
    end
  end

  describe '#accept_lending_policy' do
    let(:mock_patron) { instance_double(Patron,
                                        barcode: '1234',
                                        library: 'UP-PAT',
                                        key: user.patron_key,
                                        custom_information: [
                                          {
                                            resource: '/user/patron/customInformation',
                                            key: '1',
                                            fields: {
                                              code: {
                                                resource: '/policy/patronExtendedInformation',
                                                key: 'PSUACCOUNT'
                                              }.with_indifferent_access,
                                              data: '20050801'
                                            }.with_indifferent_access
                                          }.with_indifferent_access,
                                          {
                                            resource: '/user/patron/customInformation',
                                            key: '19',
                                            fields: {
                                              code: {
                                                resource: '/policy/patronExtendedInformation',
                                                key: 'GARNISH-DT'
                                              }.with_indifferent_access,
                                              data: '00000000'
                                            }.with_indifferent_access
                                          }.with_indifferent_access
                                        ],
                                        garnish_date: '00000000') }

    let(:new_garnish_date) { DateTime.now.strftime('%Y%m%d') }

    let(:new_custom_information) { [
      {
        resource: '/user/patron/customInformation',
        key: '1',
        fields: {
          code: {
            resource: '/policy/patronExtendedInformation',
            key: 'PSUACCOUNT'
          }.with_indifferent_access,
          data: '20050801'
        }.with_indifferent_access
      }.with_indifferent_access,
      {
        resource: '/user/patron/customInformation',
        key: '19',
        fields: {
          code: {
            resource: '/policy/patronExtendedInformation',
            key: 'GARNISH-DT'
          }.with_indifferent_access,
          data: new_garnish_date
        }.with_indifferent_access
      }.with_indifferent_access
    ] }

    let(:request_body) {
      {
        resource: '/user/patron',
        key: '1234567',
        fields: {
          standing: {
            resource: '/policy/patronStanding',
            key: 'OK'
          },
          customInformation: new_custom_information
        }
      }
    }

    before do
      stub_request(:put, "#{Settings.symws.url}/user/patron/key/1234567")
        .with(body: request_body)
    end

    it 'sends a request to update the garnish date and patron standing' do
      client.accept_lending_policy(patron: mock_patron, session_token: user.session_token)
      expect(WebMock).to have_requested(:put, "#{Settings.symws.url}/user/patron/key/1234567")
        .with(body: request_body)
    end
  end

  describe '#change_pickup_library' do
    let(:symphony_response) { { status: 200 } }
    let(:change_pickup_library_response) { client.change_pickup_library(hold_key: 'a_hold_key',
                                                                        pickup_library: 'UP-PAT',
                                                                        session_token: user.session_token) }

    before do
      stub_request(:post, 'https://example.com/symwsbc/circulation/holdRecord/changePickupLibrary')
        .with(body: { "holdRecord": {
                "resource": '/circulation/holdRecord',
                "key": 'a_hold_key'
              },
                      "pickupLibrary": {
                        "resource": '/policy/library',
                        "key": 'UP-PAT'
                      } })
        .to_return(symphony_response)
    end

    it 'successfully changes the pickup library' do
      expect(change_pickup_library_response.status).to eq 200
    end

    context 'when the web service does not respond with a 200' do
      let(:symphony_response) { { status: 400, body: error_prompt } }

      let(:error_prompt) do
        { messageList: [{ code: 'some_error_code', message: 'Some error message' }] }.to_json
      end

      it 'fails to change the pickup library' do
        expect(change_pickup_library_response.status).to eq 400
      end

      it 'returns an error message' do
        parsed_response = JSON.parse(change_pickup_library_response)
        expect(parsed_response['messageList'].first).to include 'message' => 'Some error message'
      end
    end
  end

  describe '#not_needed_after' do
    let(:symphony_response) { { status: 200 } }
    let(:not_needed_after_response) { client.not_needed_after(hold_key: 'a_hold_key',
                                                              fill_by_date: '2021-03-17',
                                                              session_token: user.session_token) }

    before do
      stub_request(:put, 'https://example.com/symwsbc/circulation/holdRecord/key/a_hold_key')
        .with(body: { "resource": '/circulation/holdRecord',
                      "key": 'a_hold_key',
                      "fields": {
                        "fillByDate": '2021-03-17'
                      } })
        .to_return(symphony_response)
    end

    it 'successfully updates the not needed after date' do
      expect(not_needed_after_response.status).to eq 200
    end

    context 'when the web service does not respond with a 200' do
      let(:symphony_response) { { status: 400, body: error_prompt } }

      let(:error_prompt) do
        { messageList: [{ code: 'some_error_code', message: 'Some error message' }] }.to_json
      end

      it 'fails to update the not needed after date' do
        expect(not_needed_after_response.status).to eq 400
      end

      it 'returns an error message' do
        expect(JSON.parse(not_needed_after_response)['messageList'].first).to include 'message' => 'Some error message'
      end
    end
  end

  describe '#renew' do
    before do
      stub_request(:post, "#{Settings.symws.url}/circulation/circRecord/renew")
        .with(query: hash_including(includeFields: 'circRecord{*}'),
              body: { item: { resource: 'item', key: '123' } })
        .to_return(status: 200, body: { key: 'checkout_key' }.to_json)
      stub_request(:post, "#{Settings.symws.url}/circulation/circRecord/renew")
        .with(query: hash_including(includeFields: 'circRecord{*}'),
              body: { item: { resource: 'item', key: '456' } })
        .to_return(status: 400, body: error_prompt)
    end

    let(:error_prompt) do
      { messageList: [{ code: 'some_other_code', message: 'Some error message' }] }.to_json
    end

    context 'when the web service responds with a 200' do
      let(:renew_response) { client.renew(resource: 'item',
                                          item_key: '123',
                                          session_token: user.session_token) }

      it 'successfully renews the item' do
        expect(renew_response.status).to eq 200
      end

      it 'successfully returns the checkout info' do
        expect(JSON.parse(renew_response.body)).to include 'key' => 'checkout_key'
      end
    end

    context 'when the web service does not responds with a 200' do
      let(:renew_response) { client.renew(resource: 'item',
                                          item_key: '456',
                                          session_token: user.session_token) }

      it 'fails to renew the item' do
        expect(renew_response.status).to eq 400
      end

      it 'returns an error message' do
        expect(JSON.parse(renew_response.body)['messageList'].first).to include 'message' => 'Some error message'
      end
    end
  end

  describe '#cancel_hold' do
    let(:symphony_response) { { status: 200 } }
    let(:cancel_hold_response) { client.cancel_hold(hold_key: 'a_hold_key', session_token: user.session_token) }

    before do
      stub_request(:post, 'https://example.com/symwsbc/circulation/holdRecord/cancelHold')
        .with(body: { holdRecord: {
                resource: '/circulation/holdRecord',
                key: 'a_hold_key'
              } })
        .to_return(symphony_response)
    end

    it 'successfully cancels the hold' do
      expect(cancel_hold_response.status).to eq 200
    end

    context 'when the web service does not respond with a 200' do
      let(:symphony_response) { { status: 400, body: error_prompt } }
      let(:error_prompt) do
        { messageList: [{ code: 'some_error_code', message: 'Some error message' }] }.to_json
      end

      it 'fails to cancel hold and returns an error message' do
        expect(JSON.parse(cancel_hold_response)['messageList'].first).to include 'message' => 'Some error message'
      end
    end
  end

  describe '#get_bib_info' do
    before do
      stub_request(:get, "#{Settings.symws.url}/catalog/bib/key/12345")
        .with(query: hash_including(includeFields: match(/\*,callList/)))
        .to_return(status: 200, body: '{"resource": "/catalog/bib"}', headers: {})
    end

    it 'returns the Symphony Client "catalog bib" resource type' do
      bib_response = client.get_bib_info '12345', user.session_token

      expect(bib_response.body.to_str).to include '/catalog/bib'
    end
  end

  describe '#place_hold' do
    before do
      stub_request(:post, uri)
        .with(body: { "itemBarcode": 'success_item_barcode',
                      "patronBarcode": '1234',
                      "pickupLibrary": {
                        "resource": '/policy/library',
                        "key": 'UP-PAT'
                      },
                      "holdType": 'TITLE',
                      "holdRange": 'SYSTEM',
                      "fillByDate": '2021-03-17' })
        .to_return(status: 200, body: { key: 'some_hold_key' }.to_json)

      stub_request(:post, uri)
        .with(body: { "itemBarcode": 'fail_item_barcode',
                      "patronBarcode": '1234',
                      "pickupLibrary": {
                        "resource": '/policy/library',
                        "key": 'UP-PAT'
                      },
                      "holdType": 'TITLE',
                      "holdRange": 'SYSTEM',
                      "fillByDate": '2021-03-17' })
        .to_return(status: 500, body: error_prompt)

      stub_request(:post, uri)
        .with(body: { "itemBarcode": 'no_date_item_barcode',
                      "patronBarcode": '1234',
                      "pickupLibrary": {
                        "resource": '/policy/library',
                        "key": 'UP-PAT'
                      },
                      "holdType": 'TITLE',
                      "holdRange": 'SYSTEM' })
        .to_return(status: 200, body: { key: 'other_hold_key' }.to_json)

      stub_request(:post, uri)
        .with(body: { "itemBarcode": 'records_in_use_barcode',
                      "patronBarcode": '1234',
                      "pickupLibrary": {
                        "resource": '/policy/library',
                        "key": 'UP-PAT'
                      },
                      "holdType": 'TITLE',
                      "holdRange": 'SYSTEM',
                      "fillByDate": '2021-03-17' })
        .to_return({ status: 500, body: error_prompt }, status: 200, body: { key: 'some_hold_key' }.to_json)
    end

    let(:uri) { "#{Settings.symws.url}/circulation/holdRecord/placeHold" }
    let(:patron) { instance_double(Patron, barcode: '1234', library: 'UP-PAT') }
    let(:hold_args) { { pickup_library: 'UP-PAT', pickup_by_date: '2021-03-17' } }
    let(:error_prompt) { { messageList: [{ code: 'some_error_code', message: 'Some error message' }] }.to_json }

    context 'when place hold is successful' do
      it 'returns the hold key' do
        item_barcode = 'success_item_barcode'
        place_hold_response = client.place_hold(patron, user.session_token, item_barcode, hold_args)

        expect(JSON.parse(place_hold_response)).to include 'key' => 'some_hold_key'
      end
    end

    context 'when place hold fails' do
      it 'returns the reason as the error message' do
        item_barcode = 'fail_item_barcode'
        place_hold_response = client.place_hold(patron, user.session_token, item_barcode, hold_args)

        expect(JSON.parse(place_hold_response)['messageList'].first).to include 'message' => 'Some error message'
      end
    end

    context 'when place hold does not include fill by date' do
      it 'returns the hold key' do
        item_barcode = 'no_date_item_barcode'
        hold_args = { pickup_library: 'UP-PAT' }
        place_hold_response = client.place_hold(patron, user.session_token, item_barcode, hold_args)

        expect(JSON.parse(place_hold_response)).to include 'key' => 'other_hold_key'
      end
    end

    context 'when place hold return records in use error' do
      let(:error_prompt) { { messageList: [{ code: 'hatErrorResponse.116', message: 'Records in use' }] }.to_json }

      it 'keeps trying for 5 seconds max until the record is not in use' do
        item_barcode = 'records_in_use_barcode'
        place_hold_response = client.place_hold(patron, user.session_token, item_barcode, hold_args)

        expect(JSON.parse(place_hold_response)).to include 'key' => 'some_hold_key'
      end
    end
  end

  describe '#get_hold_info' do
    let(:hold_key) { 'a_hold_key' }
    let(:uri) { "#{Settings.symws.url}/circulation/holdRecord/key/#{hold_key}" }
    let(:include_fields) { '*,item{*,bib{shadowed,title,author},call{*}}' }

    context 'when item level information is present' do
      before do
        stub_request(:any, /example.com/).to_rack(FakeSymphony)
      end

      it 'returns the hold info' do
        response = client.get_hold_info('3912343', user.session_token)
        parsed_response = JSON.parse response.body
        expect(parsed_response&.dig('fields', 'pickupLibrary')).to be_truthy
      end
    end

    context 'when item level information is missing' do
      before do
        stub_request(:get, uri)
          .with(query: hash_including(includeFields: include_fields))
          .to_return(status: 200, body: { resource: '/circulation/holdRecord' }.to_json)
        stub_const 'SymphonyClient::MAX_WAIT_TIME', 0.3
        stub_const 'SymphonyClient::DELAY', 0.1
      end

      it 'retries' do
        client.get_hold_info(hold_key, user.session_token)
        expect { client.get_hold_info(hold_key, user.session_token) }
          .to output(/title missing/).to_stdout_from_any_process
      end
    end
  end

  describe '#get_item_info' do
    before do
      stub_request(:get, uri)
        .with(query: hash_including(includeFields: include_fields))
        .to_return(status: 200, body: { resource: '/catalog/item' }.to_json)
    end

    let(:barcode) { 'a_barcode' }
    let(:uri) { "#{Settings.symws.url}/catalog/item/barcode/#{barcode}" }
    let(:include_fields) { '*,bib{shadowed,title,author},call{*}' }

    it 'returns the resource item record' do
      item_response = client.get_item_info(barcode: barcode, session_token: user.session_token)

      expect(JSON.parse(item_response)).to include 'resource' => '/catalog/item'
    end
  end

  describe '#get_item_type_map' do
    before do
      stub_request(:get, 'https://example.com/symwsbc/policy/itemType/simpleQuery')
        .with(query: hash_including(includeFields: 'displayName,description'))
        .to_return(status: 200, body: ITEM_TYPE_MAPPING.to_json, headers: {})
    end

    it 'returns displayName and descriptions of itemType' do
      response = client.get_item_type_map

      expect(response).to eq ITEM_TYPE_MAPPING
    end
  end

  describe '#get_all_locations' do
    before do
      stub_request(:get, 'https://example.com/symwsbc/policy/location/simpleQuery')
        .with(query: hash_including(includeFields: 'displayName,holdable'))
        .to_return(status: 200, body: ALL_LOCATIONS.to_json, headers: {})
    end

    it 'retrieves a list of all locations' do
      response = client.get_all_locations

      expect(JSON.parse(response)).to eq ALL_LOCATIONS
    end
  end
end
