# frozen_string_literal: true

FactoryBot.define do
  factory :call do
    initialize_with { new(record: record) }

    record {
      { 'resource' => '/catalog/call',
        'key' => '26141494:4',
        'fields' =>
           { 'library' => { 'resource' => '/policy/library', 'key' => 'UP-PAT' },
             'callNumber' => 'HN13.D52 2019',
             'shadowed' => false,
             'volumetric' => nil,
             'dispCallNumber' => 'HN13.D52 2019',
             'bib' => { 'resource' => '/catalog/bib', 'key' => '26141494' },
             'itemList' =>
                [{ 'resource' => '/catalog/item',
                   'key' => '26141494:4:1',
                   'fields' =>
                      { 'call' => { 'resource' => '/catalog/call', 'key' => '26141494:4' },
                        'mediaDesk' => nil,
                        'itemType' => { 'resource' => '/policy/itemType', 'key' => 'BOOK' },
                        'library' => { 'resource' => '/policy/library', 'key' => 'UP-PAT' },
                        'shadowed' => false,
                        'homeLocation' => { 'resource' => '/policy/location', 'key' => 'LEISURE-PA' },
                        'copyNumber' => 1,
                        'bib' => { 'resource' => '/catalog/bib', 'key' => '26141494' },
                        'barcode' => '000080793182',
                        'circulate' => false,
                        'currentLocation' => { 'resource' => '/policy/location', 'key' => 'CHECKEDOUT' } } },
                 { 'resource' => '/catalog/item',
                   'key' => '26141494:4:2',
                   'fields' =>
                      { 'call' => { 'resource' => '/catalog/call', 'key' => '26141494:4' },
                        'mediaDesk' => nil,
                        'itemType' => { 'resource' => '/policy/itemType', 'key' => 'BOOK' },
                        'library' => { 'resource' => '/policy/library', 'key' => 'UP-PAT' },
                        'shadowed' => false,
                        'homeLocation' => { 'resource' => '/policy/location', 'key' => 'PATERNO-2' },
                        'copyNumber' => 2,
                        'bib' => { 'resource' => '/catalog/bib', 'key' => '26141494' },
                        'barcode' => '000081297085',
                        'circulate' => false,
                        'currentLocation' => { 'resource' => '/policy/location', 'key' => 'ILLEND' } } }],
             'classification' => { 'resource' => '/policy/classification', 'key' => 'LC' } } }
    }
  end
end
