# frozen_string_literal: true

FactoryBot.define do
  factory :hold do
    record {
      {
        'resource' => '/circulation/holdRecord',
        'key' => '3899610',
        'fields' => {
          'pickupLibrary' => {
            'resource' => '/policy/library', 'key' => 'UP-PAT'
          }, 'item' => {
            'resource' => '/catalog/item', 'key' => '28877460:1:1', 'fields' => {
              'itemCategory4' => nil, 'itemCategory3' => nil, 'itemCategory2' => nil, 'itemType' => {
                'resource' => '/policy/itemType', 'key' => 'PALCI'
              }, 'itemCategory1' => nil, 'itemCategory5' => nil, 'systemModifiedDate' => '2019-11-18T12:44:00-05:00',
              'circulate' => true, 'currentLocation' => {
                'resource' => '/policy/location', 'key' => 'ONHOLD-PA'
              }, 'call' => {
                'resource' => '/catalog/call', 'key' => '28877460:1', 'fields' => {
                  'sortCallNumber' => 'DF 000234 .W745 2004', 'dispCallNumber' => 'DF234 .W745 2004'
                }
              }, 'mediaDesk' => nil, 'pieces' => 1, 'createdDate' => '2019-11-18', 'library' => {
                'resource' => '/policy/library', 'key' => 'UP-PAT'
              }, 'shadowed' => true, 'permanent' => false, 'price' => {
                'currencyCode' => 'USD', 'amount' => '0.00'
              }, 'homeLocation' => {
                'resource' => '/policy/location', 'key' => 'PALCI'
              }, 'copyNumber' => 1, 'timesInventoried' => 0, 'lastInvDate' => nil, 'bib' => {
                'resource' => '/catalog/bib', 'key' => '28877460', 'fields' => {
                  'author' => 'WORTHINGTON IAN', 'title' => 'ALEXANDER THE GREAT - MAN AND GOD'
                }
              }, 'barcode' => '000081204298'
            }
          }, 'patron' => {
            'resource' => '/user/patron', 'key' => '1001125'
          }, 'queueLength' => 1, 'queuePosition' => 1, 'selectedItem' => {
            'resource' => '/catalog/item', 'key' => '28877460:1:1'
          }, 'inactiveReason' => nil, 'fillByDate' => '2020-01-17', 'inactiveDate' => nil, 'placedLibrary' => {
            'resource' => '/policy/library', 'key' => 'ABINGTON'
          }, 'suspendEndDate' => nil, 'beingHeldDate' => '2019-11-18', 'holdRange' => {
            'resource' => '/policy/holdRange', 'key' => 'SYSTEM'
          }, 'bib' => {
            'resource' => '/catalog/bib', 'key' => '28877460', 'fields' => {
              'author' => 'WORTHINGTON IAN', 'title' => 'ALEXANDER THE GREAT - MAN AND GOD', 'callList' => []
            }
          }, 'comment' => '', 'holdType' => 'COPY', 'placedDate' => '2019-11-18', 'suspendBeginDate' => nil,
          'expirationDate' => nil, 'status' => 'BEING_HELD'
        }

      }
    }

    initialize_with { new(attributes[:record]) }
  end
end
