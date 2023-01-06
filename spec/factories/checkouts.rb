# frozen_string_literal: true

FactoryBot.define do
  factory :checkout do
    record {
      {
        'resource' => '/circulation/circRecord',
        'key' => '24053411:3:1:1',
        'fields' => {
          'circulationRule' => {
            'resource' => '/policy/circulationRule',
            'key' => 'VIDEO7DAY'
          },
          'recallDueDate' => '2019-12-20T23:59:00-05:00',
          'patron' => {
            'resource' => '/user/patron',
            'key' => '18511'
          },
          'item' => {
            'resource' => '/catalog/item',
            'key' => '24053411:3:1',
            'fields' => {
              'itemCategory4' => nil,
              'itemCategory3' => nil,
              'itemCategory2' => nil,
              'itemType' => {
                'resource' => '/policy/itemType',
                'key' => 'VIDEO'
              },
              'itemCategory1' => nil,
              'itemCategory5' => nil,
              'systemModifiedDate' => '2018-09-20T11:23:00-04:00',
              'circulate' => false,
              'currentLocation' => {
                'resource' => '/policy/location',
                'key' => 'CHECKEDOUT'
              },
              'call' => {
                'resource' => '/catalog/call',
                'key' => '24053411:3',
                'fields' => {
                  'sortCallNumber' => 'PN 001992.4 .R56W66 2018 DVD',
                  'dispCallNumber' => 'PN1992.4.R56W66 2018 DVD'
                }
              },
              'mediaDesk' => nil,
              'pieces' => 1,
              'createdDate' => '2018-07-26',
              'library' => {
                'resource' => '/policy/library',
                'key' => 'UP-PAT'
              },
              'shadowed' => false,
              'permanent' => true,
              'price' => {
                'currencyCode' => 'USD',
                'amount' => '0.00'
              },
              'homeLocation' => {
                'resource' => '/policy/location',
                'key' => 'ATRIUM-DVD'
              },
              'copyNumber' => 1,
              'timesInventoried' => 0,
              'lastInvDate' => nil,
              'bib' => {
                'resource' => '/catalog/bib',
                'key' => '24053411',
                'fields' => {
                  'author' => 'Neville, Morgan, film director, film producer.',
                  'title' => "Won't you be my neighbor?"
                }
              },
              'barcode' => '000080477600'
            }
          },
          'piecesReturned' => 0,
          'dueDate' => '2019-11-14T23:59:00-05:00',
          'renewalCount' => 2,
          'renewalDate' => '2019-11-07T04:27:00-05:00',
          'estimatedOverdueAmount' => {
            'currencyCode' => 'USD',
            'amount' => '10.00'
          },
          'seenRenewalsRemaining' => 6,
          'library' => {
            'resource' => '/policy/library',
            'key' => 'UP-PAT'
          },
          'checkOutDate' => '2019-10-18T14:58:00-04:00',
          'claimsReturnedDate' => nil,
          'overdue' => true,
          'unseenRenewalsRemaining' => 6,
          'recalledDate' => '2019-12-10',
          'status' => 'ACTIVE'
        }
      }
    }

    initialize_with { new(attributes[:record]) }
  end
end
