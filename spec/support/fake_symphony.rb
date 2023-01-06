# frozen_string_literal: true

require 'support/fake_webservice'

class FakeSymphony < FakeWebservice
  get '/symwsbc/user/patron/key/:key' do
    json_response 200, "patrons/#{params[:key]}.json"
  end

  get '/symwsbc/catalog/bib/key/:key' do
    json_response 200, "other/bib_#{params[:key]}.json"
  end

  get '/symwsbc/catalog/item/barcode/:barcode' do
    json_response 200, "other/barcode_#{params[:barcode]}.json"
  end

  get '/symwsbc/policy/location/simpleQuery' do
    json_response 200, 'other/locations.json'
  end

  get '/symwsbc/policy/itemType/simpleQuery' do
    json_response 200, 'other/item_type_map.json'
  end

  get '/symwsbc/circulation/holdRecord/key/:key' do
    json_response 200, 'other/hold.json'
  end

  get '/symwsbc/catalog/item/key/:key' do
    json_response 200, 'other/item.json'
  end

  post '/symwsbc/circulation/holdRecord/changePickupLibrary' do
    content_type :json
    status 200
    {}.to_json
  end

  put '/symwsbc/circulation/holdRecord/key/:key' do
    content_type :json
    status 200
    {}.to_json
  end

  get '/symwsbc/circulation/holdRecord/key/:key' do
    json_response 200, "other/hold_lookup_#{params[:key]}.json"
  end

  post '/symwsbc/circulation/holdRecord/placeHold' do
    json_response 200, 'other/place_hold.json'
  end

  post '/symwsbc/circulation/holdRecord/cancelHold' do
    content_type :json
    status 200
    {}.to_json
  end

  post '/symwsbc/circulation/circRecord/renew' do
    request.body.rewind
    key = json_body(request).dig('item', 'key')
    if key == '3591032:1:1'
      json_response 500, "other/renewal_#{key}.json"
    else
      json_response 200, "other/renewal_#{key}.json"
    end
  end

  put '/symwsbc/user/patron/key/:key' do
    json_response 200, "patrons/#{params[:key]}.json"
  end

  private

    def json_body(request)
      JSON.parse request.body.read
    end
end
