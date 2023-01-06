# frozen_string_literal: true

FactoryBot.define do
  factory :fine do
    record {
      {
        'resource' => '/circulation/block',
        'key' => '18511:94',
        'fields' => {
          'patron' => {
            'resource' => '/user/patron', 'key' => '18511'
          },
          'amount' => {
            'currencyCode' => 'USD', 'amount' => '6.00'
          },
          'item' => {
            'resource' => '/catalog/item',
            'key' => '10957508:1:2',
            'fields' => {
              'itemCategory4' => nil,
              'itemCategory3' => nil,
              'itemCategory2' => nil,
              'itemType' => {
                'resource' => '/policy/itemType', 'key' => 'BOOK'
              },
              'itemCategory1' => nil,
              'itemCategory5' => nil,
              'systemModifiedDate' => '2014-03-07T21:32:00-05:00',
              'circulate' => true,
              'currentLocation' => {
                'resource' => '/policy/location', 'key' => 'RESERVE-PA'
              },
              'call' => {
                'resource' => '/catalog/call',
                'key' => '10957508:1',
                'fields' => {
                  'sortCallNumber' => 'INSTRUCTOR COPY - COMM 000150H',
                  'dispCallNumber' => 'INSTRUCTOR COPY - COMM 150H'
                }
              },
              'mediaDesk' => nil,
              'pieces' => 1,
              'createdDate' => '2013-08-27',
              'library' => {
                'resource' => '/policy/library', 'key' => 'UP-PAT'
              },
              'shadowed' => true,
              'permanent' => false,
              'price' => {
                'currencyCode' => 'USD', 'amount' => '0.00'
              },
              'homeLocation' => {
                'resource' => '/policy/location', 'key' => 'CLOSERESPA'
              },
              'lastInvDate' => nil,
              'bib' => {
                'resource' => '/catalog/bib',
                'key' => '10957508',
                'fields' => {
                  'author' => 'PRAMAGGIORE, MARIA, ET AL.',
                  'title' => 'FILM A CRITICAL INTRODUCTION'
                }
              },
              'barcode' => '000071932903'
            }
          },
          'tax' => {
            'currencyCode' => 'USD', 'amount' => '0.00'
          },
          'billDate' => '2019-12-06',
          'estimatedOverdueAmount' => {
            'currencyCode' => 'USD', 'amount' => '0.00'
          },
          'title' => 'FILM A CRITICAL INTRODUCTION',
          'owed' => {
            'currencyCode' => 'USD', 'amount' => '6.00'
          },
          'library' => {
            'resource' => '/policy/library', 'key' => 'UP-PAT'
          },
          'callNumber' => 'INSTRUCTOR COPY - COMM 150H',
          'block' => {
            'resource' => '/policy/block',
            'key' => 'RESERVEOVD',
            'fields' => {
              'description' => 'Recall overdue'
            }
          },
          'comment' => nil
        }
      }
    }

    initialize_with { new(attributes[:record]) }
  end
end
