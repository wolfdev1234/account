# frozen_string_literal: true

FactoryBot.define do
  factory :bib do
    factory :bib_without_holdables do
      initialize_with {
        new(body)
      }

      body {
        {
          'resource' => '/catalog/bib',
          'key' => '26141494',
          'fields' => {
            'shadowed' => false,
            'author' => 'Diamond, Jared M. author.',
            'titleControlNumber' => 'l2018952825',
            'catalogDate' => '2019-05-28',
            'catalogFormat' => {
              'resource' => '/policy/catalogFormat', 'key' => 'MARC'
            },
            'modifiedDate' => '2019-12-08',
            'systemModifiedDate' => '2020-02-04T15:11:00-05:00',
            'title' => 'Upheaval : turning points for nations in crisis',
            'callList' => [{
              'resource' => '/catalog/call',
              'key' => '26141494:4',
              'fields' => {
                'library' => {
                  'resource' => '/policy/library', 'key' => 'UP-PAT'
                },
                'callNumber' => 'HN13.D52 2019',
                'shadowed' => false,
                'volumetric' => nil,
                'dispCallNumber' => 'HN13.D52 2019',
                'bib' => {
                  'resource' => '/catalog/bib', 'key' => '26141494'
                },
                'itemList' => [{
                  'resource' => '/catalog/item',
                  'key' => '26141494:4:1',
                  'fields' => {
                    'call' => {
                      'resource' => '/catalog/call', 'key' => '26141494:4'
                    },
                    'mediaDesk' => nil,
                    'itemType' => {
                      'resource' => '/policy/itemType', 'key' => 'BOOK'
                    },
                    'library' => {
                      'resource' => '/policy/library', 'key' => 'UP-PAT'
                    },
                    'shadowed' => false,
                    'homeLocation' => {
                      'resource' => '/policy/location', 'key' => 'LEISURE-PA'
                    },
                    'copyNumber' => 1,
                    'bib' => {
                      'resource' => '/catalog/bib', 'key' => '26141494'
                    },
                    'barcode' => '000080793182',
                    'circulate' => false,
                    'currentLocation' => {
                      'resource' => '/policy/location', 'key' => 'CHECKEDOUT'
                    }
                  }
                },
                               {
                                 'resource' => '/catalog/item',
                                 'key' => '26141494:4:2',
                                 'fields' => {
                                   'call' => {
                                     'resource' => '/catalog/call', 'key' => '26141494:4'
                                   },
                                   'mediaDesk' => nil,
                                   'itemType' => {
                                     'resource' => '/policy/itemType', 'key' => 'BOOK'
                                   },
                                   'library' => {
                                     'resource' => '/policy/library', 'key' => 'UP-PAT'
                                   },
                                   'shadowed' => false,
                                   'homeLocation' => {
                                     'resource' => '/policy/location', 'key' => 'PATERNO-2'
                                   },
                                   'copyNumber' => 2,
                                   'bib' => {
                                     'resource' => '/catalog/bib', 'key' => '26141494'
                                   },
                                   'barcode' => '000081297085',
                                   'circulate' => false,
                                   'currentLocation' => {
                                     'resource' => '/policy/location', 'key' => 'ILLEND'
                                   }
                                 }
                               }],
                'classification' => {
                  'resource' => '/policy/classification', 'key' => 'LC'
                }
              }
            },
                           {
                             'resource' => '/catalog/call',
                             'key' => '26141494:6',
                             'fields' => {
                               'library' => {
                                 'resource' => '/policy/library', 'key' => 'ALTOONA'
                               },
                               'callNumber' => 'HN13.D52 2019',
                               'shadowed' => false,
                               'volumetric' => nil,
                               'dispCallNumber' => 'HN13.D52 2019',
                               'bib' => {
                                 'resource' => '/catalog/bib', 'key' => '26141494'
                               },
                               'itemList' => [{
                                 'resource' => '/catalog/item',
                                 'key' => '26141494:6:1',
                                 'fields' => {
                                   'call' => {
                                     'resource' => '/catalog/call', 'key' => '26141494:6'
                                   },
                                   'mediaDesk' => nil,
                                   'itemType' => {
                                     'resource' => '/policy/itemType', 'key' => 'BOOKFLOAT'
                                   },
                                   'library' => {
                                     'resource' => '/policy/library', 'key' => 'ALTOONA'
                                   },
                                   'shadowed' => false,
                                   'homeLocation' => {
                                     'resource' => '/policy/location', 'key' => 'STACKS-AA'
                                   },
                                   'copyNumber' => 1,
                                   'bib' => {
                                     'resource' => '/catalog/bib', 'key' => '26141494'
                                   },
                                   'barcode' => '000081321605',
                                   'circulate' => false,
                                   'currentLocation' => {
                                     'resource' => '/policy/location', 'key' => 'ILLEND'
                                   }
                                 }
                               }],
                               'classification' => {
                                 'resource' => '/policy/classification', 'key' => 'LC'
                               }
                             }
                           },
                           {
                             'resource' => '/catalog/call',
                             'key' => '26141494:3',
                             'fields' => {
                               'library' => {
                                 'resource' => '/policy/library', 'key' => 'BEHREND'
                               },
                               'callNumber' => 'HN13.D52 2019',
                               'shadowed' => false,
                               'volumetric' => nil,
                               'dispCallNumber' => 'HN13.D52 2019',
                               'bib' => {
                                 'resource' => '/catalog/bib', 'key' => '26141494'
                               },
                               'itemList' => [{
                                 'resource' => '/catalog/item',
                                 'key' => '26141494:3:1',
                                 'fields' => {
                                   'call' => {
                                     'resource' => '/catalog/call', 'key' => '26141494:3'
                                   },
                                   'mediaDesk' => nil,
                                   'itemType' => {
                                     'resource' => '/policy/itemType', 'key' => 'BOOKFLOAT'
                                   },
                                   'library' => {
                                     'resource' => '/policy/library', 'key' => 'BEHREND'
                                   },
                                   'shadowed' => false,
                                   'homeLocation' => {
                                     'resource' => '/policy/location', 'key' => 'STACKS-BD'
                                   },
                                   'copyNumber' => 1,
                                   'bib' => {
                                     'resource' => '/catalog/bib', 'key' => '26141494'
                                   },
                                   'barcode' => '000081287932',
                                   'circulate' => false,
                                   'currentLocation' => {
                                     'resource' => '/policy/location', 'key' => 'ILLEND'
                                   }
                                 }
                               }],
                               'classification' => {
                                 'resource' => '/policy/classification', 'key' => 'LC'
                               }
                             }
                           },
                           {
                             'resource' => '/catalog/call',
                             'key' => '26141494:5',
                             'fields' => {
                               'library' => {
                                 'resource' => '/policy/library', 'key' => 'WSCRANTON'
                               },
                               'callNumber' => 'HN13.D52 2019',
                               'shadowed' => false,
                               'volumetric' => nil,
                               'dispCallNumber' => 'HN13.D52 2019',
                               'bib' => {
                                 'resource' => '/catalog/bib', 'key' => '26141494'
                               },
                               'itemList' => [{
                                 'resource' => '/catalog/item',
                                 'key' => '26141494:5:1',
                                 'fields' => {
                                   'call' => {
                                     'resource' => '/catalog/call', 'key' => '26141494:5'
                                   },
                                   'mediaDesk' => nil,
                                   'itemType' => {
                                     'resource' => '/policy/itemType', 'key' => 'BOOKFLOAT'
                                   },
                                   'library' => {
                                     'resource' => '/policy/library', 'key' => 'WSCRANTON'
                                   },
                                   'shadowed' => false,
                                   'homeLocation' => {
                                     'resource' => '/policy/location', 'key' => 'STACKS-WS'
                                   },
                                   'copyNumber' => 1,
                                   'bib' => {
                                     'resource' => '/catalog/bib', 'key' => '26141494'
                                   },
                                   'barcode' => '000081402335',
                                   'circulate' => true,
                                   'currentLocation' => {
                                     'resource' => '/policy/location', 'key' => 'INTRANSIT'
                                   }
                                 }
                               }],
                               'classification' => {
                                 'resource' => '/policy/classification', 'key' => 'LC'
                               }
                             }
                           },
                           {
                             'resource' => '/catalog/call',
                             'key' => '26141494:1',
                             'fields' => {
                               'library' => {
                                 'resource' => '/policy/library', 'key' => 'WSCRANTON'
                               },
                               'callNumber' => 'SN15687372',
                               'shadowed' => false,
                               'volumetric' => nil,
                               'dispCallNumber' => 'SN15687372',
                               'bib' => {
                                 'resource' => '/catalog/bib', 'key' => '26141494'
                               },
                               'itemList' => [],
                               'classification' => {
                                 'resource' => '/policy/classification', 'key' => 'LC'
                               }
                             }
                           }],
            'createDate' => '2019-03-11'
          }
        }
      }
    end

    factory :bib_with_no_holdable_locations do
      initialize_with {
        new(body)
      }

      body {
        {
          'resource' => '/catalog/bib',
          'key' => '26141494',
          'fields' => {
            'shadowed' => false,
            'author' => 'Diamond, Jared M. author.',
            'titleControlNumber' => 'l2018952825',
            'catalogDate' => '2019-05-28',
            'catalogFormat' => {
              'resource' => '/policy/catalogFormat', 'key' => 'MARC'
            },
            'modifiedDate' => '2019-12-08',
            'systemModifiedDate' => '2020-02-04T15:11:00-05:00',
            'title' => 'Upheaval : turning points for nations in crisis',
            'callList' => [{
              'resource' => '/catalog/call',
              'key' => '26141494:4',
              'fields' => {
                'library' => {
                  'resource' => '/policy/library', 'key' => 'UP-PAT'
                },
                'callNumber' => 'HN13.D52 2019',
                'shadowed' => false,
                'volumetric' => nil,
                'dispCallNumber' => 'HN13.D52 2019',
                'bib' => {
                  'resource' => '/catalog/bib', 'key' => '26141494'
                },
                'itemList' => [{
                  'resource' => '/catalog/item',
                  'key' => '26141494:4:2',
                  'fields' => {
                    'call' => {
                      'resource' => '/catalog/call', 'key' => '26141494:4'
                    },
                    'mediaDesk' => nil,
                    'itemType' => {
                      'resource' => '/policy/itemType', 'key' => 'BOOK'
                    },
                    'library' => {
                      'resource' => '/policy/library', 'key' => 'UP-PAT'
                    },
                    'shadowed' => false,
                    'homeLocation' => {
                      'resource' => '/policy/location', 'key' => 'PATERNO-2'
                    },
                    'copyNumber' => 2,
                    'bib' => {
                      'resource' => '/catalog/bib', 'key' => '26141494'
                    },
                    'barcode' => '000081297085',
                    'circulate' => false,
                    'currentLocation' => {
                      'resource' => '/policy/location', 'key' => 'ILLEND'
                    }
                  }
                }],
                'classification' => {
                  'resource' => '/policy/classification', 'key' => 'LC'
                }
              }
            },
                           {
                             'resource' => '/catalog/call',
                             'key' => '26141494:6',
                             'fields' => {
                               'library' => {
                                 'resource' => '/policy/library', 'key' => 'ALTOONA'
                               },
                               'callNumber' => 'HN13.D52 2019',
                               'shadowed' => false,
                               'volumetric' => nil,
                               'dispCallNumber' => 'HN13.D52 2019',
                               'bib' => {
                                 'resource' => '/catalog/bib', 'key' => '26141494'
                               },
                               'itemList' => [{
                                 'resource' => '/catalog/item',
                                 'key' => '26141494:6:1',
                                 'fields' => {
                                   'call' => {
                                     'resource' => '/catalog/call', 'key' => '26141494:6'
                                   },
                                   'mediaDesk' => nil,
                                   'itemType' => {
                                     'resource' => '/policy/itemType', 'key' => 'BOOKFLOAT'
                                   },
                                   'library' => {
                                     'resource' => '/policy/library', 'key' => 'ALTOONA'
                                   },
                                   'shadowed' => false,
                                   'homeLocation' => {
                                     'resource' => '/policy/location', 'key' => 'STACKS-AA'
                                   },
                                   'copyNumber' => 1,
                                   'bib' => {
                                     'resource' => '/catalog/bib', 'key' => '26141494'
                                   },
                                   'barcode' => '000081321605',
                                   'circulate' => false,
                                   'currentLocation' => {
                                     'resource' => '/policy/location', 'key' => 'ILLEND'
                                   }
                                 }
                               }],
                               'classification' => {
                                 'resource' => '/policy/classification', 'key' => 'LC'
                               }
                             }
                           },
                           {
                             'resource' => '/catalog/call',
                             'key' => '26141494:3',
                             'fields' => {
                               'library' => {
                                 'resource' => '/policy/library', 'key' => 'BEHREND'
                               },
                               'callNumber' => 'HN13.D52 2019',
                               'shadowed' => false,
                               'volumetric' => nil,
                               'dispCallNumber' => 'HN13.D52 2019',
                               'bib' => {
                                 'resource' => '/catalog/bib', 'key' => '26141494'
                               },
                               'itemList' => [{
                                 'resource' => '/catalog/item',
                                 'key' => '26141494:3:1',
                                 'fields' => {
                                   'call' => {
                                     'resource' => '/catalog/call', 'key' => '26141494:3'
                                   },
                                   'mediaDesk' => nil,
                                   'itemType' => {
                                     'resource' => '/policy/itemType', 'key' => 'BOOKFLOAT'
                                   },
                                   'library' => {
                                     'resource' => '/policy/library', 'key' => 'BEHREND'
                                   },
                                   'shadowed' => false,
                                   'homeLocation' => {
                                     'resource' => '/policy/location', 'key' => 'STACKS-BD'
                                   },
                                   'copyNumber' => 1,
                                   'bib' => {
                                     'resource' => '/catalog/bib', 'key' => '26141494'
                                   },
                                   'barcode' => '000081287932',
                                   'circulate' => false,
                                   'currentLocation' => {
                                     'resource' => '/policy/location', 'key' => 'ILLEND'
                                   }
                                 }
                               }],
                               'classification' => {
                                 'resource' => '/policy/classification', 'key' => 'LC'
                               }
                             }
                           },
                           {
                             'resource' => '/catalog/call',
                             'key' => '26141494:1',
                             'fields' => {
                               'library' => {
                                 'resource' => '/policy/library', 'key' => 'WSCRANTON'
                               },
                               'callNumber' => 'SN15687372',
                               'shadowed' => false,
                               'volumetric' => nil,
                               'dispCallNumber' => 'SN15687372',
                               'bib' => {
                                 'resource' => '/catalog/bib', 'key' => '26141494'
                               },
                               'itemList' => [],
                               'classification' => {
                                 'resource' => '/policy/classification', 'key' => 'LC'
                               }
                             }
                           }],
            'createDate' => '2019-03-11'
          }
        }
      }
    end

    factory :bib_with_holdables do
      initialize_with {
        new(body)
      }

      body {
        {
          'resource' => '/catalog/bib',
          'key' => '12747187',
          'fields' => {
            'shadowed' => false,
            'author' => 'Hill Street blues (Television program)',
            'titleControlNumber' => 'ocn880677198',
            'catalogDate' => nil,
            'catalogFormat' => {
              'resource' => '/policy/catalogFormat', 'key' => 'VM'
            },
            'modifiedDate' => '2018-08-04',
            'systemModifiedDate' => '2020-02-04T15:46:00-05:00',
            'title' => 'Hill Street blues. The complete series',
            'callList' => [{
              'resource' => '/catalog/call',
              'key' => '12747187:8',
              'fields' => {
                'library' => {
                  'resource' => '/policy/library', 'key' => 'BEHREND'
                },
                'callNumber' => 'PN1992.77.H485 2014 DVD',
                'shadowed' => false,
                'volumetric' => 'bklet.',
                'dispCallNumber' => 'PN1992.77.H485 2014 DVD bklet.',
                'bib' => {
                  'resource' => '/catalog/bib', 'key' => '12747187'
                },
                'itemList' => [{
                  'resource' => '/catalog/item',
                  'key' => '12747187:8:1',
                  'fields' => {
                    'call' => {
                      'resource' => '/catalog/call', 'key' => '12747187:8'
                    },
                    'mediaDesk' => nil,
                    'itemType' => {
                      'resource' => '/policy/itemType', 'key' => 'VIDEO'
                    },
                    'library' => {
                      'resource' => '/policy/library', 'key' => 'BEHREND'
                    },
                    'shadowed' => false,
                    'homeLocation' => {
                      'resource' => '/policy/location', 'key' => 'MEDIA-BD'
                    },
                    'copyNumber' => 1,
                    'bib' => {
                      'resource' => '/catalog/bib', 'key' => '12747187'
                    },
                    'barcode' => '000077108494',
                    'circulate' => false,
                    'currentLocation' => {
                      'resource' => '/policy/location', 'key' => 'CHECKEDOUT'
                    }
                  }
                }],
                'classification' => {
                  'resource' => '/policy/classification', 'key' => 'LC'
                }
              }
            },
                           {
                             'resource' => '/catalog/call',
                             'key' => '12747187:1',
                             'fields' => {
                               'library' => {
                                 'resource' => '/policy/library', 'key' => 'BEHREND'
                               },
                               'callNumber' => 'PN1992.77.H485 2014 DVD',
                               'shadowed' => false,
                               'volumetric' => 'v.1',
                               'dispCallNumber' => 'PN1992.77.H485 2014 DVD v.1',
                               'bib' => {
                                 'resource' => '/catalog/bib', 'key' => '12747187'
                               },
                               'itemList' => [{
                                 'resource' => '/catalog/item',
                                 'key' => '12747187:1:1',
                                 'fields' => {
                                   'call' => {
                                     'resource' => '/catalog/call', 'key' => '12747187:1'
                                   },
                                   'mediaDesk' => nil,
                                   'itemType' => {
                                     'resource' => '/policy/itemType', 'key' => 'VIDEO'
                                   },
                                   'library' => {
                                     'resource' => '/policy/library', 'key' => 'BEHREND'
                                   },
                                   'shadowed' => false,
                                   'homeLocation' => {
                                     'resource' => '/policy/location', 'key' => 'MEDIA-BD'
                                   },
                                   'copyNumber' => 1,
                                   'bib' => {
                                     'resource' => '/catalog/bib', 'key' => '12747187'
                                   },
                                   'barcode' => '000075504342',
                                   'circulate' => false,
                                   'currentLocation' => {
                                     'resource' => '/policy/location', 'key' => 'CHECKEDOUT'
                                   }
                                 }
                               }],
                               'classification' => {
                                 'resource' => '/policy/classification', 'key' => 'LC'
                               }
                             }
                           },
                           {
                             'resource' => '/catalog/call',
                             'key' => '12747187:2',
                             'fields' => {
                               'library' => {
                                 'resource' => '/policy/library', 'key' => 'BEHREND'
                               },
                               'callNumber' => 'PN1992.77.H485 2014 DVD',
                               'shadowed' => false,
                               'volumetric' => 'v.2',
                               'dispCallNumber' => 'PN1992.77.H485 2014 DVD v.2',
                               'bib' => {
                                 'resource' => '/catalog/bib', 'key' => '12747187'
                               },
                               'itemList' => [{
                                 'resource' => '/catalog/item',
                                 'key' => '12747187:2:1',
                                 'fields' => {
                                   'call' => {
                                     'resource' => '/catalog/call', 'key' => '12747187:2'
                                   },
                                   'mediaDesk' => nil,
                                   'itemType' => {
                                     'resource' => '/policy/itemType', 'key' => 'VIDEO'
                                   },
                                   'library' => {
                                     'resource' => '/policy/library', 'key' => 'BEHREND'
                                   },
                                   'shadowed' => false,
                                   'homeLocation' => {
                                     'resource' => '/policy/location', 'key' => 'MEDIA-BD'
                                   },
                                   'copyNumber' => 1,
                                   'bib' => {
                                     'resource' => '/catalog/bib', 'key' => '12747187'
                                   },
                                   'barcode' => '000077108531',
                                   'circulate' => false,
                                   'currentLocation' => {
                                     'resource' => '/policy/location', 'key' => 'CHECKEDOUT'
                                   }
                                 }
                               }],
                               'classification' => {
                                 'resource' => '/policy/classification', 'key' => 'LC'
                               }
                             }
                           },
                           {
                             'resource' => '/catalog/call',
                             'key' => '12747187:3',
                             'fields' => {
                               'library' => {
                                 'resource' => '/policy/library', 'key' => 'BEHREND'
                               },
                               'callNumber' => 'PN1992.77.H485 2014 DVD',
                               'shadowed' => false,
                               'volumetric' => 'v.3',
                               'dispCallNumber' => 'PN1992.77.H485 2014 DVD v.3',
                               'bib' => {
                                 'resource' => '/catalog/bib', 'key' => '12747187'
                               },
                               'itemList' => [{
                                 'resource' => '/catalog/item',
                                 'key' => '12747187:3:1',
                                 'fields' => {
                                   'call' => {
                                     'resource' => '/catalog/call', 'key' => '12747187:3'
                                   },
                                   'mediaDesk' => nil,
                                   'itemType' => {
                                     'resource' => '/policy/itemType', 'key' => 'VIDEO'
                                   },
                                   'library' => {
                                     'resource' => '/policy/library', 'key' => 'BEHREND'
                                   },
                                   'shadowed' => false,
                                   'homeLocation' => {
                                     'resource' => '/policy/location', 'key' => 'MEDIA-BD'
                                   },
                                   'copyNumber' => 1,
                                   'bib' => {
                                     'resource' => '/catalog/bib', 'key' => '12747187'
                                   },
                                   'barcode' => '000077108562',
                                   'circulate' => false,
                                   'currentLocation' => {
                                     'resource' => '/policy/location', 'key' => 'CHECKEDOUT'
                                   }
                                 }
                               }],
                               'classification' => {
                                 'resource' => '/policy/classification', 'key' => 'LC'
                               }
                             }
                           },
                           {
                             'resource' => '/catalog/call',
                             'key' => '12747187:4',
                             'fields' => {
                               'library' => {
                                 'resource' => '/policy/library', 'key' => 'BEHREND'
                               },
                               'callNumber' => 'PN1992.77.H485 2014 DVD',
                               'shadowed' => false,
                               'volumetric' => 'v.4',
                               'dispCallNumber' => 'PN1992.77.H485 2014 DVD v.4',
                               'bib' => {
                                 'resource' => '/catalog/bib', 'key' => '12747187'
                               },
                               'itemList' => [{
                                 'resource' => '/catalog/item',
                                 'key' => '12747187:4:1',
                                 'fields' => {
                                   'call' => {
                                     'resource' => '/catalog/call', 'key' => '12747187:4'
                                   },
                                   'mediaDesk' => nil,
                                   'itemType' => {
                                     'resource' => '/policy/itemType', 'key' => 'VIDEO'
                                   },
                                   'library' => {
                                     'resource' => '/policy/library', 'key' => 'BEHREND'
                                   },
                                   'shadowed' => false,
                                   'homeLocation' => {
                                     'resource' => '/policy/location', 'key' => 'MEDIA-BD'
                                   },
                                   'copyNumber' => 1,
                                   'bib' => {
                                     'resource' => '/catalog/bib', 'key' => '12747187'
                                   },
                                   'barcode' => '000077108555',
                                   'circulate' => false,
                                   'currentLocation' => {
                                     'resource' => '/policy/location', 'key' => 'CHECKEDOUT'
                                   }
                                 }
                               }],
                               'classification' => {
                                 'resource' => '/policy/classification', 'key' => 'LC'
                               }
                             }
                           },
                           {
                             'resource' => '/catalog/call',
                             'key' => '12747187:5',
                             'fields' => {
                               'library' => {
                                 'resource' => '/policy/library', 'key' => 'BEHREND'
                               },
                               'callNumber' => 'PN1992.77.H485 2014 DVD',
                               'shadowed' => false,
                               'volumetric' => 'v.5',
                               'dispCallNumber' => 'PN1992.77.H485 2014 DVD v.5',
                               'bib' => {
                                 'resource' => '/catalog/bib', 'key' => '12747187'
                               },
                               'itemList' => [{
                                 'resource' => '/catalog/item',
                                 'key' => '12747187:5:1',
                                 'fields' => {
                                   'call' => {
                                     'resource' => '/catalog/call', 'key' => '12747187:5'
                                   },
                                   'mediaDesk' => nil,
                                   'itemType' => {
                                     'resource' => '/policy/itemType', 'key' => 'VIDEO'
                                   },
                                   'library' => {
                                     'resource' => '/policy/library', 'key' => 'BEHREND'
                                   },
                                   'shadowed' => false,
                                   'homeLocation' => {
                                     'resource' => '/policy/location', 'key' => 'MEDIA-BD'
                                   },
                                   'copyNumber' => 1,
                                   'bib' => {
                                     'resource' => '/catalog/bib', 'key' => '12747187'
                                   },
                                   'barcode' => '000077108548',
                                   'circulate' => false,
                                   'currentLocation' => {
                                     'resource' => '/policy/location', 'key' => 'CHECKEDOUT'
                                   }
                                 }
                               }],
                               'classification' => {
                                 'resource' => '/policy/classification', 'key' => 'LC'
                               }
                             }
                           },
                           {
                             'resource' => '/catalog/call',
                             'key' => '12747187:6',
                             'fields' => {
                               'library' => {
                                 'resource' => '/policy/library', 'key' => 'BEHREND'
                               },
                               'callNumber' => 'PN1992.77.H485 2014 DVD',
                               'shadowed' => false,
                               'volumetric' => 'v.6',
                               'dispCallNumber' => 'PN1992.77.H485 2014 DVD v.6',
                               'bib' => {
                                 'resource' => '/catalog/bib', 'key' => '12747187'
                               },
                               'itemList' => [{
                                 'resource' => '/catalog/item',
                                 'key' => '12747187:6:1',
                                 'fields' => {
                                   'call' => {
                                     'resource' => '/catalog/call', 'key' => '12747187:6'
                                   },
                                   'mediaDesk' => nil,
                                   'itemType' => {
                                     'resource' => '/policy/itemType', 'key' => 'VIDEO'
                                   },
                                   'library' => {
                                     'resource' => '/policy/library', 'key' => 'BEHREND'
                                   },
                                   'shadowed' => false,
                                   'homeLocation' => {
                                     'resource' => '/policy/location', 'key' => 'MEDIA-BD'
                                   },
                                   'copyNumber' => 1,
                                   'bib' => {
                                     'resource' => '/catalog/bib', 'key' => '12747187'
                                   },
                                   'barcode' => '000077108524',
                                   'circulate' => false,
                                   'currentLocation' => {
                                     'resource' => '/policy/location', 'key' => 'CHECKEDOUT'
                                   }
                                 }
                               }],
                               'classification' => {
                                 'resource' => '/policy/classification', 'key' => 'LC'
                               }
                             }
                           },
                           {
                             'resource' => '/catalog/call',
                             'key' => '12747187:7',
                             'fields' => {
                               'library' => {
                                 'resource' => '/policy/library', 'key' => 'BEHREND'
                               },
                               'callNumber' => 'PN1992.77.H485 2014 DVD',
                               'shadowed' => false,
                               'volumetric' => 'v.7',
                               'dispCallNumber' => 'PN1992.77.H485 2014 DVD v.7',
                               'bib' => {
                                 'resource' => '/catalog/bib', 'key' => '12747187'
                               },
                               'itemList' => [{
                                 'resource' => '/catalog/item',
                                 'key' => '12747187:7:1',
                                 'fields' => {
                                   'call' => {
                                     'resource' => '/catalog/call', 'key' => '12747187:7'
                                   },
                                   'mediaDesk' => nil,
                                   'itemType' => {
                                     'resource' => '/policy/itemType', 'key' => 'VIDEO'
                                   },
                                   'library' => {
                                     'resource' => '/policy/library', 'key' => 'BEHREND'
                                   },
                                   'shadowed' => false,
                                   'homeLocation' => {
                                     'resource' => '/policy/location', 'key' => 'MEDIA-BD'
                                   },
                                   'copyNumber' => 1,
                                   'bib' => {
                                     'resource' => '/catalog/bib', 'key' => '12747187'
                                   },
                                   'barcode' => '000077108500',
                                   'circulate' => true,
                                   'currentLocation' => {
                                     'resource' => '/policy/location', 'key' => 'INTRANSIT'
                                   }
                                 }
                               }],
                               'classification' => {
                                 'resource' => '/policy/classification', 'key' => 'LC'
                               }
                             }
                           }],
            'createDate' => '2014-07-16'
          }
        }
      }
    end

    factory :bib_with_dupe_call_number_volumetrics_one_unique do
      initialize_with {
        new(body)
      }
      body {
        { 'resource' => '/catalog/bib',
          'key' => '1220805',
          'fields' =>
             { 'shadowed' => false,
               'author' =>
                  'American University (Washington, D.C.). Foreign Areas Studies Division.',
               'titleControlNumber' => 'l72600260',
               'catalogDate' => '1997-07-23',
               'catalogFormat' => { 'resource' => '/policy/catalogFormat', 'key' => 'SERIAL' },
               'modifiedDate' => '2020-01-15',
               'systemModifiedDate' => '2020-09-09T13:27:00-04:00',
               'title' => 'Area handbook for the Democratic Republic of Sudan',
               'callList' =>
                  [{ 'resource' => '/catalog/call',
                     'key' => '1220805:1',
                     'fields' =>
                        { 'library' => { 'resource' => '/policy/library', 'key' => 'HARRISBURG' },
                          'callNumber' => 'DT154.6.S93',
                          'shadowed' => false,
                          'volumetric' => '1973',
                          'dispCallNumber' => 'DT154.6.S93 1973',
                          'bib' => { 'resource' => '/catalog/bib', 'key' => '1220805' },
                          'itemList' =>
                             [{ 'resource' => '/catalog/item',
                                'key' => '1220805:1:1',
                                'fields' =>
                                   { 'call' => { 'resource' => '/catalog/call', 'key' => '1220805:1' },
                                     'mediaDesk' => nil,
                                     'itemType' => { 'resource' => '/policy/itemType', 'key' => 'SERIAL' },
                                     'library' => { 'resource' => '/policy/library', 'key' => 'HARRISBURG' },
                                     'shadowed' => false,
                                     'homeLocation' =>
                                        { 'resource' => '/policy/location', 'key' => 'STACKS-HB2' },
                                     'copyNumber' => 1,
                                     'bib' => { 'resource' => '/catalog/bib', 'key' => '1220805' },
                                     'barcode' => '000022026637',
                                     'circulate' => true,
                                     'currentLocation' =>
                                        { 'resource' => '/policy/location', 'key' => 'STACKS-HB2' } } }],
                          'classification' =>
                             { 'resource' => '/policy/classification', 'key' => 'LCPER' } } },
                   { 'resource' => '/catalog/call',
                     'key' => '1220805:4',
                     'fields' =>
                        { 'library' => { 'resource' => '/policy/library', 'key' => 'UP-ANNEX' },
                          'callNumber' => 'DT154.6.S93',
                          'shadowed' => false,
                          'volumetric' => '1973',
                          'dispCallNumber' => 'DT154.6.S93 1973',
                          'bib' => { 'resource' => '/catalog/bib', 'key' => '1220805' },
                          'itemList' =>
                             [{ 'resource' => '/catalog/item',
                                'key' => '1220805:4:1',
                                'fields' =>
                                   { 'call' => { 'resource' => '/catalog/call', 'key' => '1220805:4' },
                                     'mediaDesk' => nil,
                                     'itemType' => { 'resource' => '/policy/itemType', 'key' => 'SERIAL' },
                                     'library' => { 'resource' => '/policy/library', 'key' => 'UP-ANNEX' },
                                     'shadowed' => false,
                                     'homeLocation' =>
                                        { 'resource' => '/policy/location', 'key' => 'CATO-2' },
                                     'copyNumber' => 1,
                                     'bib' => { 'resource' => '/catalog/bib', 'key' => '1220805' },
                                     'barcode' => '000002040981',
                                     'circulate' => true,
                                     'currentLocation' =>
                                        { 'resource' => '/policy/location', 'key' => 'CATO-2' } } },
                              { 'resource' => '/catalog/item',
                                'key' => '1220805:4:2',
                                'fields' =>
                                   { 'call' => { 'resource' => '/catalog/call', 'key' => '1220805:4' },
                                     'mediaDesk' => nil,
                                     'itemType' => { 'resource' => '/policy/itemType', 'key' => 'SERIAL' },
                                     'library' => { 'resource' => '/policy/library', 'key' => 'UP-ANNEX' },
                                     'shadowed' => false,
                                     'homeLocation' =>
                                        { 'resource' => '/policy/location', 'key' => 'CATO-2' },
                                     'copyNumber' => 2,
                                     'bib' => { 'resource' => '/catalog/bib', 'key' => '1220805' },
                                     'barcode' => '000010494721',
                                     'circulate' => true,
                                     'currentLocation' =>
                                        { 'resource' => '/policy/location', 'key' => 'CATO-2' } } }],
                          'classification' =>
                             { 'resource' => '/policy/classification', 'key' => 'LCPER' } } }],
               'createDate' => '2001-04-13' } }
      }
    end

    factory :bib_with_dupe_call_number_volumetrics do
      initialize_with {
        new(body)
      }

      body {
        {
          'resource' => '/catalog/bib', 'key' => '7517385', 'fields' => {
            'shadowed' => false, 'author' => 'Columbus, Chris.', 'titleControlNumber' => 'i9780780674318', 'catalogDate' => '2011-12-07', 'catalogFormat' => {
              'resource' => '/policy/catalogFormat', 'key' => 'VM'
            }, 'modifiedDate' => '2019-09-09', 'systemModifiedDate' => '2020-02-24T15:33:00-05:00', 'title' => 'Harry Potter complete 8-film collection [videorecording]', 'callList' => [{
              'resource' => '/catalog/call',
              'key' => '7517385:17',
              'fields' => {
                'library' => {
                  'resource' => '/policy/library', 'key' => 'UP-PAT'
                }, 'callNumber' => 'PN1995.9.F36H377 2011', 'shadowed' => false, 'volumetric' => 'DVD disc.1', 'dispCallNumber' => 'PN1995.9.F36H377 2011 DVD disc.1', 'bib' => {
                  'resource' => '/catalog/bib', 'key' => '7517385'
                }, 'itemList' => [{
                  'resource' => '/catalog/item',
                  'key' => '7517385:17:1',
                  'fields' => {
                    'call' => {
                      'resource' => '/catalog/call', 'key' => '7517385:17'
                    }, 'mediaDesk' => nil, 'itemType' => {
                      'resource' => '/policy/itemType', 'key' => 'VIDEO'
                    }, 'library' => {
                      'resource' => '/policy/library', 'key' => 'UP-PAT'
                    }, 'shadowed' => false, 'homeLocation' => {
                      'resource' => '/policy/location', 'key' => 'ATRIUM-DVD'
                    }, 'copyNumber' => 1, 'bib' => {
                      'resource' => '/catalog/bib', 'key' => '7517385'
                    }, 'barcode' => '000076647505', 'circulate' => true, 'currentLocation' => {
                      'resource' => '/policy/location', 'key' => 'ATRIUM-DVD'
                    }
                  }
                }], 'classification' => {
                  'resource' => '/policy/classification', 'key' => 'LC'
                }
              },
              'naturalized_volumetric' => ['DVD', 'disc', 1.0]
            }, {
              'resource' => '/catalog/call',
              'key' => '7517385:18',
              'fields' => {
                'library' => {
                  'resource' => '/policy/library', 'key' => 'UP-PAT'
                }, 'callNumber' => 'PN1995.9.F36H377 2011', 'shadowed' => false, 'volumetric' => 'DVD disc.2', 'dispCallNumber' => 'PN1995.9.F36H377 2011 DVD disc.2', 'bib' => {
                  'resource' => '/catalog/bib', 'key' => '7517385'
                }, 'itemList' => [{
                  'resource' => '/catalog/item',
                  'key' => '7517385:18:1',
                  'fields' => {
                    'call' => {
                      'resource' => '/catalog/call', 'key' => '7517385:18'
                    }, 'mediaDesk' => nil, 'itemType' => {
                      'resource' => '/policy/itemType', 'key' => 'VIDEO'
                    }, 'library' => {
                      'resource' => '/policy/library', 'key' => 'UP-PAT'
                    }, 'shadowed' => false, 'homeLocation' => {
                      'resource' => '/policy/location', 'key' => 'ATRIUM-DVD'
                    }, 'copyNumber' => 1, 'bib' => {
                      'resource' => '/catalog/bib', 'key' => '7517385'
                    }, 'barcode' => '000076502217', 'circulate' => false, 'currentLocation' => {
                      'resource' => '/policy/location', 'key' => 'CHECKEDOUT'
                    }
                  }
                }], 'classification' => {
                  'resource' => '/policy/classification', 'key' => 'LC'
                }
              },
              'naturalized_volumetric' => ['DVD', 'disc', 2.0]
            }, {
              'resource' => '/catalog/call',
              'key' => '7517385:19',
              'fields' => {
                'library' => {
                  'resource' => '/policy/library', 'key' => 'UP-PAT'
                }, 'callNumber' => 'PN1995.9.F36H377 2011', 'shadowed' => false, 'volumetric' => 'DVD disc.3', 'dispCallNumber' => 'PN1995.9.F36H377 2011 DVD disc.3', 'bib' => {
                  'resource' => '/catalog/bib', 'key' => '7517385'
                }, 'itemList' => [{
                  'resource' => '/catalog/item',
                  'key' => '7517385:19:1',
                  'fields' => {
                    'call' => {
                      'resource' => '/catalog/call', 'key' => '7517385:19'
                    }, 'mediaDesk' => nil, 'itemType' => {
                      'resource' => '/policy/itemType', 'key' => 'VIDEO'
                    }, 'library' => {
                      'resource' => '/policy/library', 'key' => 'UP-PAT'
                    }, 'shadowed' => false, 'homeLocation' => {
                      'resource' => '/policy/location', 'key' => 'ATRIUM-DVD'
                    }, 'copyNumber' => 1, 'bib' => {
                      'resource' => '/catalog/bib', 'key' => '7517385'
                    }, 'barcode' => '000076501944', 'circulate' => true, 'currentLocation' => {
                      'resource' => '/policy/location', 'key' => 'ATRIUM-DVD'
                    }
                  }
                }], 'classification' => {
                  'resource' => '/policy/classification', 'key' => 'LC'
                }
              },
              'naturalized_volumetric' => ['DVD', 'disc', 3.0]
            }, {
              'resource' => '/catalog/call',
              'key' => '7517385:20',
              'fields' => {
                'library' => {
                  'resource' => '/policy/library', 'key' => 'UP-PAT'
                }, 'callNumber' => 'PN1995.9.F36H377 2011', 'shadowed' => false, 'volumetric' => 'DVD disc.4', 'dispCallNumber' => 'PN1995.9.F36H377 2011 DVD disc.4', 'bib' => {
                  'resource' => '/catalog/bib', 'key' => '7517385'
                }, 'itemList' => [{
                  'resource' => '/catalog/item',
                  'key' => '7517385:20:1',
                  'fields' => {
                    'call' => {
                      'resource' => '/catalog/call', 'key' => '7517385:20'
                    }, 'mediaDesk' => nil, 'itemType' => {
                      'resource' => '/policy/itemType', 'key' => 'VIDEO'
                    }, 'library' => {
                      'resource' => '/policy/library', 'key' => 'UP-PAT'
                    }, 'shadowed' => false, 'homeLocation' => {
                      'resource' => '/policy/location', 'key' => 'ATRIUM-DVD'
                    }, 'copyNumber' => 1, 'bib' => {
                      'resource' => '/catalog/bib', 'key' => '7517385'
                    }, 'barcode' => '000076502545', 'circulate' => false, 'currentLocation' => {
                      'resource' => '/policy/location', 'key' => 'CHECKEDOUT'
                    }
                  }
                }], 'classification' => {
                  'resource' => '/policy/classification', 'key' => 'LC'
                }
              },
              'naturalized_volumetric' => ['DVD', 'disc', 4.0]
            }, {
              'resource' => '/catalog/call',
              'key' => '7517385:21',
              'fields' => {
                'library' => {
                  'resource' => '/policy/library', 'key' => 'UP-PAT'
                }, 'callNumber' => 'PN1995.9.F36H377 2011', 'shadowed' => false, 'volumetric' => 'DVD disc.5', 'dispCallNumber' => 'PN1995.9.F36H377 2011 DVD disc.5', 'bib' => {
                  'resource' => '/catalog/bib', 'key' => '7517385'
                }, 'itemList' => [{
                  'resource' => '/catalog/item',
                  'key' => '7517385:21:1',
                  'fields' => {
                    'call' => {
                      'resource' => '/catalog/call', 'key' => '7517385:21'
                    }, 'mediaDesk' => nil, 'itemType' => {
                      'resource' => '/policy/itemType', 'key' => 'VIDEO'
                    }, 'library' => {
                      'resource' => '/policy/library', 'key' => 'UP-PAT'
                    }, 'shadowed' => false, 'homeLocation' => {
                      'resource' => '/policy/location', 'key' => 'ATRIUM-DVD'
                    }, 'copyNumber' => 1, 'bib' => {
                      'resource' => '/catalog/bib', 'key' => '7517385'
                    }, 'barcode' => '000076502224', 'circulate' => false, 'currentLocation' => {
                      'resource' => '/policy/location', 'key' => 'CHECKEDOUT'
                    }
                  }
                }], 'classification' => {
                  'resource' => '/policy/classification', 'key' => 'LC'
                }
              },
              'naturalized_volumetric' => ['DVD', 'disc', 5.0]
            }, {
              'resource' => '/catalog/call',
              'key' => '7517385:22',
              'fields' => {
                'library' => {
                  'resource' => '/policy/library', 'key' => 'UP-PAT'
                }, 'callNumber' => 'PN1995.9.F36H377 2011', 'shadowed' => false, 'volumetric' => 'DVD disc.6', 'dispCallNumber' => 'PN1995.9.F36H377 2011 DVD disc.6', 'bib' => {
                  'resource' => '/catalog/bib', 'key' => '7517385'
                }, 'itemList' => [{
                  'resource' => '/catalog/item',
                  'key' => '7517385:22:1',
                  'fields' => {
                    'call' => {
                      'resource' => '/catalog/call', 'key' => '7517385:22'
                    }, 'mediaDesk' => nil, 'itemType' => {
                      'resource' => '/policy/itemType', 'key' => 'VIDEO'
                    }, 'library' => {
                      'resource' => '/policy/library', 'key' => 'UP-PAT'
                    }, 'shadowed' => false, 'homeLocation' => {
                      'resource' => '/policy/location', 'key' => 'ATRIUM-DVD'
                    }, 'copyNumber' => 1, 'bib' => {
                      'resource' => '/catalog/bib', 'key' => '7517385'
                    }, 'barcode' => '000076502255', 'circulate' => false, 'currentLocation' => {
                      'resource' => '/policy/location', 'key' => 'CHECKEDOUT'
                    }
                  }
                }], 'classification' => {
                  'resource' => '/policy/classification', 'key' => 'LC'
                }
              },
              'naturalized_volumetric' => ['DVD', 'disc', 6.0]
            }, {
              'resource' => '/catalog/call',
              'key' => '7517385:23',
              'fields' => {
                'library' => {
                  'resource' => '/policy/library', 'key' => 'UP-PAT'
                }, 'callNumber' => 'PN1995.9.F36H377 2011', 'shadowed' => false, 'volumetric' => 'DVD disc.7', 'dispCallNumber' => 'PN1995.9.F36H377 2011 DVD disc.7', 'bib' => {
                  'resource' => '/catalog/bib', 'key' => '7517385'
                }, 'itemList' => [{
                  'resource' => '/catalog/item',
                  'key' => '7517385:23:1',
                  'fields' => {
                    'call' => {
                      'resource' => '/catalog/call', 'key' => '7517385:23'
                    }, 'mediaDesk' => nil, 'itemType' => {
                      'resource' => '/policy/itemType', 'key' => 'VIDEO'
                    }, 'library' => {
                      'resource' => '/policy/library', 'key' => 'UP-PAT'
                    }, 'shadowed' => false, 'homeLocation' => {
                      'resource' => '/policy/location', 'key' => 'ATRIUM-DVD'
                    }, 'copyNumber' => 1, 'bib' => {
                      'resource' => '/catalog/bib', 'key' => '7517385'
                    }, 'barcode' => '000076502569', 'circulate' => false, 'currentLocation' => {
                      'resource' => '/policy/location', 'key' => 'CHECKEDOUT'
                    }
                  }
                }], 'classification' => {
                  'resource' => '/policy/classification', 'key' => 'LC'
                }
              },
              'naturalized_volumetric' => ['DVD', 'disc', 7.0]
            }, {
              'resource' => '/catalog/call',
              'key' => '7517385:24',
              'fields' => {
                'library' => {
                  'resource' => '/policy/library', 'key' => 'UP-PAT'
                }, 'callNumber' => 'PN1995.9.F36H377 2011', 'shadowed' => false, 'volumetric' => 'DVD disc.8', 'dispCallNumber' => 'PN1995.9.F36H377 2011 DVD disc.8', 'bib' => {
                  'resource' => '/catalog/bib', 'key' => '7517385'
                }, 'itemList' => [{
                  'resource' => '/catalog/item',
                  'key' => '7517385:24:1',
                  'fields' => {
                    'call' => {
                      'resource' => '/catalog/call', 'key' => '7517385:24'
                    }, 'mediaDesk' => nil, 'itemType' => {
                      'resource' => '/policy/itemType', 'key' => 'VIDEO'
                    }, 'library' => {
                      'resource' => '/policy/library', 'key' => 'UP-PAT'
                    }, 'shadowed' => false, 'homeLocation' => {
                      'resource' => '/policy/location', 'key' => 'ATRIUM-DVD'
                    }, 'copyNumber' => 1, 'bib' => {
                      'resource' => '/catalog/bib', 'key' => '7517385'
                    }, 'barcode' => '000076502552', 'circulate' => false, 'currentLocation' => {
                      'resource' => '/policy/location', 'key' => 'CHECKEDOUT'
                    }
                  }
                }], 'classification' => {
                  'resource' => '/policy/classification', 'key' => 'LC'
                }
              },
              'naturalized_volumetric' => ['DVD', 'disc', 8.0]
            }, {
              'resource' => '/catalog/call',
              'key' => '7517385:1',
              'fields' => {
                'library' => {
                  'resource' => '/policy/library', 'key' => 'ALTOONA'
                }, 'callNumber' => 'PN1995.9.F36H377 2011', 'shadowed' => false, 'volumetric' => 'DVD disc.1', 'dispCallNumber' => 'PN1995.9.F36H377 2011 DVD disc.1', 'bib' => {
                  'resource' => '/catalog/bib', 'key' => '7517385'
                }, 'itemList' => [{
                  'resource' => '/catalog/item',
                  'key' => '7517385:1:1',
                  'fields' => {
                    'call' => {
                      'resource' => '/catalog/call', 'key' => '7517385:1'
                    }, 'mediaDesk' => nil, 'itemType' => {
                      'resource' => '/policy/itemType', 'key' => 'VIDEO'
                    }, 'library' => {
                      'resource' => '/policy/library', 'key' => 'ALTOONA'
                    }, 'shadowed' => false, 'homeLocation' => {
                      'resource' => '/policy/location', 'key' => 'MEDIA-AA'
                    }, 'copyNumber' => 1, 'bib' => {
                      'resource' => '/catalog/bib', 'key' => '7517385'
                    }, 'barcode' => '000070921649', 'circulate' => true, 'currentLocation' => {
                      'resource' => '/policy/location', 'key' => 'MEDIA-AA'
                    }
                  }
                }], 'classification' => {
                  'resource' => '/policy/classification', 'key' => 'LC'
                }
              },
              'naturalized_volumetric' => ['DVD', 'disc', 1.0]
            }, {
              'resource' => '/catalog/call',
              'key' => '7517385:2',
              'fields' => {
                'library' => {
                  'resource' => '/policy/library', 'key' => 'ALTOONA'
                }, 'callNumber' => 'PN1995.9.F36H377 2011', 'shadowed' => false, 'volumetric' => 'DVD disc.2', 'dispCallNumber' => 'PN1995.9.F36H377 2011 DVD disc.2', 'bib' => {
                  'resource' => '/catalog/bib', 'key' => '7517385'
                }, 'itemList' => [{
                  'resource' => '/catalog/item',
                  'key' => '7517385:2:1',
                  'fields' => {
                    'call' => {
                      'resource' => '/catalog/call', 'key' => '7517385:2'
                    }, 'mediaDesk' => nil, 'itemType' => {
                      'resource' => '/policy/itemType', 'key' => 'VIDEO'
                    }, 'library' => {
                      'resource' => '/policy/library', 'key' => 'ALTOONA'
                    }, 'shadowed' => false, 'homeLocation' => {
                      'resource' => '/policy/location', 'key' => 'MEDIA-AA'
                    }, 'copyNumber' => 1, 'bib' => {
                      'resource' => '/catalog/bib', 'key' => '7517385'
                    }, 'barcode' => '000071879376', 'circulate' => true, 'currentLocation' => {
                      'resource' => '/policy/location', 'key' => 'MEDIA-AA'
                    }
                  }
                }], 'classification' => {
                  'resource' => '/policy/classification', 'key' => 'LC'
                }
              },
              'naturalized_volumetric' => ['DVD', 'disc', 2.0]
            }, {
              'resource' => '/catalog/call',
              'key' => '7517385:3',
              'fields' => {
                'library' => {
                  'resource' => '/policy/library', 'key' => 'ALTOONA'
                }, 'callNumber' => 'PN1995.9.F36H377 2011', 'shadowed' => false, 'volumetric' => 'DVD disc.3', 'dispCallNumber' => 'PN1995.9.F36H377 2011 DVD disc.3', 'bib' => {
                  'resource' => '/catalog/bib', 'key' => '7517385'
                }, 'itemList' => [{
                  'resource' => '/catalog/item',
                  'key' => '7517385:3:1',
                  'fields' => {
                    'call' => {
                      'resource' => '/catalog/call', 'key' => '7517385:3'
                    }, 'mediaDesk' => nil, 'itemType' => {
                      'resource' => '/policy/itemType', 'key' => 'VIDEO'
                    }, 'library' => {
                      'resource' => '/policy/library', 'key' => 'ALTOONA'
                    }, 'shadowed' => false, 'homeLocation' => {
                      'resource' => '/policy/location', 'key' => 'MEDIA-AA'
                    }, 'copyNumber' => 1, 'bib' => {
                      'resource' => '/catalog/bib', 'key' => '7517385'
                    }, 'barcode' => '000071879352', 'circulate' => true, 'currentLocation' => {
                      'resource' => '/policy/location', 'key' => 'MEDIA-AA'
                    }
                  }
                }], 'classification' => {
                  'resource' => '/policy/classification', 'key' => 'LC'
                }
              },
              'naturalized_volumetric' => ['DVD', 'disc', 3.0]
            }, {
              'resource' => '/catalog/call',
              'key' => '7517385:4',
              'fields' => {
                'library' => {
                  'resource' => '/policy/library', 'key' => 'ALTOONA'
                }, 'callNumber' => 'PN1995.9.F36H377 2011', 'shadowed' => false, 'volumetric' => 'DVD disc.4', 'dispCallNumber' => 'PN1995.9.F36H377 2011 DVD disc.4', 'bib' => {
                  'resource' => '/catalog/bib', 'key' => '7517385'
                }, 'itemList' => [{
                  'resource' => '/catalog/item',
                  'key' => '7517385:4:1',
                  'fields' => {
                    'call' => {
                      'resource' => '/catalog/call', 'key' => '7517385:4'
                    }, 'mediaDesk' => nil, 'itemType' => {
                      'resource' => '/policy/itemType', 'key' => 'VIDEO'
                    }, 'library' => {
                      'resource' => '/policy/library', 'key' => 'ALTOONA'
                    }, 'shadowed' => false, 'homeLocation' => {
                      'resource' => '/policy/location', 'key' => 'MEDIA-AA'
                    }, 'copyNumber' => 1, 'bib' => {
                      'resource' => '/catalog/bib', 'key' => '7517385'
                    }, 'barcode' => '000071879512', 'circulate' => true, 'currentLocation' => {
                      'resource' => '/policy/location', 'key' => 'MEDIA-AA'
                    }
                  }
                }], 'classification' => {
                  'resource' => '/policy/classification', 'key' => 'LC'
                }
              },
              'naturalized_volumetric' => ['DVD', 'disc', 4.0]
            }, {
              'resource' => '/catalog/call',
              'key' => '7517385:5',
              'fields' => {
                'library' => {
                  'resource' => '/policy/library', 'key' => 'ALTOONA'
                }, 'callNumber' => 'PN1995.9.F36H377 2011', 'shadowed' => false, 'volumetric' => 'DVD disc.5', 'dispCallNumber' => 'PN1995.9.F36H377 2011 DVD disc.5', 'bib' => {
                  'resource' => '/catalog/bib', 'key' => '7517385'
                }, 'itemList' => [{
                  'resource' => '/catalog/item',
                  'key' => '7517385:5:1',
                  'fields' => {
                    'call' => {
                      'resource' => '/catalog/call', 'key' => '7517385:5'
                    }, 'mediaDesk' => nil, 'itemType' => {
                      'resource' => '/policy/itemType', 'key' => 'VIDEO'
                    }, 'library' => {
                      'resource' => '/policy/library', 'key' => 'ALTOONA'
                    }, 'shadowed' => false, 'homeLocation' => {
                      'resource' => '/policy/location', 'key' => 'MEDIA-AA'
                    }, 'copyNumber' => 1, 'bib' => {
                      'resource' => '/catalog/bib', 'key' => '7517385'
                    }, 'barcode' => '000072006467', 'circulate' => true, 'currentLocation' => {
                      'resource' => '/policy/location', 'key' => 'MEDIA-AA'
                    }
                  }
                }], 'classification' => {
                  'resource' => '/policy/classification', 'key' => 'LC'
                }
              },
              'naturalized_volumetric' => ['DVD', 'disc', 5.0]
            }, {
              'resource' => '/catalog/call',
              'key' => '7517385:7',
              'fields' => {
                'library' => {
                  'resource' => '/policy/library', 'key' => 'ALTOONA'
                }, 'callNumber' => 'PN1995.9.F36H377 2011', 'shadowed' => false, 'volumetric' => 'DVD disc.6', 'dispCallNumber' => 'PN1995.9.F36H377 2011 DVD disc.6', 'bib' => {
                  'resource' => '/catalog/bib', 'key' => '7517385'
                }, 'itemList' => [{
                  'resource' => '/catalog/item',
                  'key' => '7517385:7:1',
                  'fields' => {
                    'call' => {
                      'resource' => '/catalog/call', 'key' => '7517385:7'
                    }, 'mediaDesk' => nil, 'itemType' => {
                      'resource' => '/policy/itemType', 'key' => 'VIDEO'
                    }, 'library' => {
                      'resource' => '/policy/library', 'key' => 'ALTOONA'
                    }, 'shadowed' => false, 'homeLocation' => {
                      'resource' => '/policy/location', 'key' => 'MEDIA-AA'
                    }, 'copyNumber' => 1, 'bib' => {
                      'resource' => '/catalog/bib', 'key' => '7517385'
                    }, 'barcode' => '000071879925', 'circulate' => true, 'currentLocation' => {
                      'resource' => '/policy/location', 'key' => 'MEDIA-AA'
                    }
                  }
                }], 'classification' => {
                  'resource' => '/policy/classification', 'key' => 'LC'
                }
              },
              'naturalized_volumetric' => ['DVD', 'disc', 6.0]
            }, {
              'resource' => '/catalog/call',
              'key' => '7517385:6',
              'fields' => {
                'library' => {
                  'resource' => '/policy/library', 'key' => 'ALTOONA'
                }, 'callNumber' => 'PN1995.9.F36H377 2011', 'shadowed' => false, 'volumetric' => 'DVD disc.7', 'dispCallNumber' => 'PN1995.9.F36H377 2011 DVD disc.7', 'bib' => {
                  'resource' => '/catalog/bib', 'key' => '7517385'
                }, 'itemList' => [{
                  'resource' => '/catalog/item',
                  'key' => '7517385:6:1',
                  'fields' => {
                    'call' => {
                      'resource' => '/catalog/call', 'key' => '7517385:6'
                    }, 'mediaDesk' => nil, 'itemType' => {
                      'resource' => '/policy/itemType', 'key' => 'VIDEO'
                    }, 'library' => {
                      'resource' => '/policy/library', 'key' => 'ALTOONA'
                    }, 'shadowed' => false, 'homeLocation' => {
                      'resource' => '/policy/location', 'key' => 'MEDIA-AA'
                    }, 'copyNumber' => 1, 'bib' => {
                      'resource' => '/catalog/bib', 'key' => '7517385'
                    }, 'barcode' => '000071879918', 'circulate' => true, 'currentLocation' => {
                      'resource' => '/policy/location', 'key' => 'MEDIA-AA'
                    }
                  }
                }], 'classification' => {
                  'resource' => '/policy/classification', 'key' => 'LC'
                }
              },
              'naturalized_volumetric' => ['DVD', 'disc', 7.0]
            }, {
              'resource' => '/catalog/call',
              'key' => '7517385:26',
              'fields' => {
                'library' => {
                  'resource' => '/policy/library', 'key' => 'DUBOIS'
                }, 'callNumber' => 'PN1995.9.F36H377 2011', 'shadowed' => false, 'volumetric' => 'DVD disc.1', 'dispCallNumber' => 'PN1995.9.F36H377 2011 DVD disc.1', 'bib' => {
                  'resource' => '/catalog/bib', 'key' => '7517385'
                }, 'itemList' => [{
                  'resource' => '/catalog/item',
                  'key' => '7517385:26:1',
                  'fields' => {
                    'call' => {
                      'resource' => '/catalog/call', 'key' => '7517385:26'
                    }, 'mediaDesk' => nil, 'itemType' => {
                      'resource' => '/policy/itemType', 'key' => 'VIDEO'
                    }, 'library' => {
                      'resource' => '/policy/library', 'key' => 'DUBOIS'
                    }, 'shadowed' => false, 'homeLocation' => {
                      'resource' => '/policy/location', 'key' => 'STACKS-DS'
                    }, 'copyNumber' => 1, 'bib' => {
                      'resource' => '/catalog/bib', 'key' => '7517385'
                    }, 'barcode' => '000081451531', 'circulate' => true, 'currentLocation' => {
                      'resource' => '/policy/location', 'key' => 'STACKS-DS'
                    }
                  }
                }], 'classification' => {
                  'resource' => '/policy/classification', 'key' => 'LC'
                }
              },
              'naturalized_volumetric' => ['DVD', 'disc', 1.0]
            }, {
              'resource' => '/catalog/call',
              'key' => '7517385:27',
              'fields' => {
                'library' => {
                  'resource' => '/policy/library', 'key' => 'DUBOIS'
                }, 'callNumber' => 'PN1995.9.F36H377 2011', 'shadowed' => false, 'volumetric' => 'DVD disc.2', 'dispCallNumber' => 'PN1995.9.F36H377 2011 DVD disc.2', 'bib' => {
                  'resource' => '/catalog/bib', 'key' => '7517385'
                }, 'itemList' => [{
                  'resource' => '/catalog/item',
                  'key' => '7517385:27:1',
                  'fields' => {
                    'call' => {
                      'resource' => '/catalog/call', 'key' => '7517385:27'
                    }, 'mediaDesk' => nil, 'itemType' => {
                      'resource' => '/policy/itemType', 'key' => 'VIDEO'
                    }, 'library' => {
                      'resource' => '/policy/library', 'key' => 'DUBOIS'
                    }, 'shadowed' => false, 'homeLocation' => {
                      'resource' => '/policy/location', 'key' => 'STACKS-DS'
                    }, 'copyNumber' => 1, 'bib' => {
                      'resource' => '/catalog/bib', 'key' => '7517385'
                    }, 'barcode' => '000081450824', 'circulate' => true, 'currentLocation' => {
                      'resource' => '/policy/location', 'key' => 'STACKS-DS'
                    }
                  }
                }], 'classification' => {
                  'resource' => '/policy/classification', 'key' => 'LC'
                }
              },
              'naturalized_volumetric' => ['DVD', 'disc', 2.0]
            }, {
              'resource' => '/catalog/call',
              'key' => '7517385:28',
              'fields' => {
                'library' => {
                  'resource' => '/policy/library', 'key' => 'DUBOIS'
                }, 'callNumber' => 'PN1995.9.F36H377 2011', 'shadowed' => false, 'volumetric' => 'DVD disc.3', 'dispCallNumber' => 'PN1995.9.F36H377 2011 DVD disc.3', 'bib' => {
                  'resource' => '/catalog/bib', 'key' => '7517385'
                }, 'itemList' => [{
                  'resource' => '/catalog/item',
                  'key' => '7517385:28:1',
                  'fields' => {
                    'call' => {
                      'resource' => '/catalog/call', 'key' => '7517385:28'
                    }, 'mediaDesk' => nil, 'itemType' => {
                      'resource' => '/policy/itemType', 'key' => 'VIDEO'
                    }, 'library' => {
                      'resource' => '/policy/library', 'key' => 'DUBOIS'
                    }, 'shadowed' => false, 'homeLocation' => {
                      'resource' => '/policy/location', 'key' => 'STACKS-DS'
                    }, 'copyNumber' => 1, 'bib' => {
                      'resource' => '/catalog/bib', 'key' => '7517385'
                    }, 'barcode' => '000081451630', 'circulate' => false, 'currentLocation' => {
                      'resource' => '/policy/location', 'key' => 'CHECKEDOUT'
                    }
                  }
                }], 'classification' => {
                  'resource' => '/policy/classification', 'key' => 'LC'
                }
              },
              'naturalized_volumetric' => ['DVD', 'disc', 3.0]
            }, {
              'resource' => '/catalog/call',
              'key' => '7517385:29',
              'fields' => {
                'library' => {
                  'resource' => '/policy/library', 'key' => 'DUBOIS'
                }, 'callNumber' => 'PN1995.9.F36H377 2011', 'shadowed' => false, 'volumetric' => 'DVD disc.4', 'dispCallNumber' => 'PN1995.9.F36H377 2011 DVD disc.4', 'bib' => {
                  'resource' => '/catalog/bib', 'key' => '7517385'
                }, 'itemList' => [{
                  'resource' => '/catalog/item',
                  'key' => '7517385:29:1',
                  'fields' => {
                    'call' => {
                      'resource' => '/catalog/call', 'key' => '7517385:29'
                    }, 'mediaDesk' => nil, 'itemType' => {
                      'resource' => '/policy/itemType', 'key' => 'VIDEO'
                    }, 'library' => {
                      'resource' => '/policy/library', 'key' => 'DUBOIS'
                    }, 'shadowed' => false, 'homeLocation' => {
                      'resource' => '/policy/location', 'key' => 'STACKS-DS'
                    }, 'copyNumber' => 1, 'bib' => {
                      'resource' => '/catalog/bib', 'key' => '7517385'
                    }, 'barcode' => '000081451623', 'circulate' => true, 'currentLocation' => {
                      'resource' => '/policy/location', 'key' => 'STACKS-DS'
                    }
                  }
                }], 'classification' => {
                  'resource' => '/policy/classification', 'key' => 'LC'
                }
              },
              'naturalized_volumetric' => ['DVD', 'disc', 4.0]
            }, {
              'resource' => '/catalog/call',
              'key' => '7517385:30',
              'fields' => {
                'library' => {
                  'resource' => '/policy/library', 'key' => 'DUBOIS'
                }, 'callNumber' => 'PN1995.9.F36H377 2011', 'shadowed' => false, 'volumetric' => 'DVD disc.5', 'dispCallNumber' => 'PN1995.9.F36H377 2011 DVD disc.5', 'bib' => {
                  'resource' => '/catalog/bib', 'key' => '7517385'
                }, 'itemList' => [{
                  'resource' => '/catalog/item',
                  'key' => '7517385:30:1',
                  'fields' => {
                    'call' => {
                      'resource' => '/catalog/call', 'key' => '7517385:30'
                    }, 'mediaDesk' => nil, 'itemType' => {
                      'resource' => '/policy/itemType', 'key' => 'VIDEO'
                    }, 'library' => {
                      'resource' => '/policy/library', 'key' => 'DUBOIS'
                    }, 'shadowed' => false, 'homeLocation' => {
                      'resource' => '/policy/location', 'key' => 'STACKS-DS'
                    }, 'copyNumber' => 1, 'bib' => {
                      'resource' => '/catalog/bib', 'key' => '7517385'
                    }, 'barcode' => '000081451616', 'circulate' => true, 'currentLocation' => {
                      'resource' => '/policy/location', 'key' => 'STACKS-DS'
                    }
                  }
                }], 'classification' => {
                  'resource' => '/policy/classification', 'key' => 'LC'
                }
              },
              'naturalized_volumetric' => ['DVD', 'disc', 5.0]
            }, {
              'resource' => '/catalog/call',
              'key' => '7517385:31',
              'fields' => {
                'library' => {
                  'resource' => '/policy/library', 'key' => 'DUBOIS'
                }, 'callNumber' => 'PN1995.9.F36H377 2011', 'shadowed' => false, 'volumetric' => 'DVD disc.6', 'dispCallNumber' => 'PN1995.9.F36H377 2011 DVD disc.6', 'bib' => {
                  'resource' => '/catalog/bib', 'key' => '7517385'
                }, 'itemList' => [{
                  'resource' => '/catalog/item',
                  'key' => '7517385:31:1',
                  'fields' => {
                    'call' => {
                      'resource' => '/catalog/call', 'key' => '7517385:31'
                    }, 'mediaDesk' => nil, 'itemType' => {
                      'resource' => '/policy/itemType', 'key' => 'VIDEO'
                    }, 'library' => {
                      'resource' => '/policy/library', 'key' => 'DUBOIS'
                    }, 'shadowed' => false, 'homeLocation' => {
                      'resource' => '/policy/location', 'key' => 'STACKS-DS'
                    }, 'copyNumber' => 1, 'bib' => {
                      'resource' => '/catalog/bib', 'key' => '7517385'
                    }, 'barcode' => '000081451586', 'circulate' => true, 'currentLocation' => {
                      'resource' => '/policy/location', 'key' => 'STACKS-DS'
                    }
                  }
                }], 'classification' => {
                  'resource' => '/policy/classification', 'key' => 'LC'
                }
              },
              'naturalized_volumetric' => ['DVD', 'disc', 6.0]
            }, {
              'resource' => '/catalog/call',
              'key' => '7517385:32',
              'fields' => {
                'library' => {
                  'resource' => '/policy/library', 'key' => 'DUBOIS'
                }, 'callNumber' => 'PN1995.9.F36H377 2011', 'shadowed' => false, 'volumetric' => 'DVD disc.7', 'dispCallNumber' => 'PN1995.9.F36H377 2011 DVD disc.7', 'bib' => {
                  'resource' => '/catalog/bib', 'key' => '7517385'
                }, 'itemList' => [{
                  'resource' => '/catalog/item',
                  'key' => '7517385:32:1',
                  'fields' => {
                    'call' => {
                      'resource' => '/catalog/call', 'key' => '7517385:32'
                    }, 'mediaDesk' => nil, 'itemType' => {
                      'resource' => '/policy/itemType', 'key' => 'VIDEO'
                    }, 'library' => {
                      'resource' => '/policy/library', 'key' => 'DUBOIS'
                    }, 'shadowed' => false, 'homeLocation' => {
                      'resource' => '/policy/location', 'key' => 'STACKS-DS'
                    }, 'copyNumber' => 1, 'bib' => {
                      'resource' => '/catalog/bib', 'key' => '7517385'
                    }, 'barcode' => '000081451494', 'circulate' => true, 'currentLocation' => {
                      'resource' => '/policy/location', 'key' => 'STACKS-DS'
                    }
                  }
                }], 'classification' => {
                  'resource' => '/policy/classification', 'key' => 'LC'
                }
              },
              'naturalized_volumetric' => ['DVD', 'disc', 7.0]
            }, {
              'resource' => '/catalog/call',
              'key' => '7517385:33',
              'fields' => {
                'library' => {
                  'resource' => '/policy/library', 'key' => 'DUBOIS'
                }, 'callNumber' => 'PN1995.9.F36H377 2011', 'shadowed' => false, 'volumetric' => 'DVD disc.8', 'dispCallNumber' => 'PN1995.9.F36H377 2011 DVD disc.8', 'bib' => {
                  'resource' => '/catalog/bib', 'key' => '7517385'
                }, 'itemList' => [{
                  'resource' => '/catalog/item',
                  'key' => '7517385:33:1',
                  'fields' => {
                    'call' => {
                      'resource' => '/catalog/call', 'key' => '7517385:33'
                    }, 'mediaDesk' => nil, 'itemType' => {
                      'resource' => '/policy/itemType', 'key' => 'VIDEO'
                    }, 'library' => {
                      'resource' => '/policy/library', 'key' => 'DUBOIS'
                    }, 'shadowed' => false, 'homeLocation' => {
                      'resource' => '/policy/location', 'key' => 'STACKS-DS'
                    }, 'copyNumber' => 1, 'bib' => {
                      'resource' => '/catalog/bib', 'key' => '7517385'
                    }, 'barcode' => '000081451500', 'circulate' => true, 'currentLocation' => {
                      'resource' => '/policy/location', 'key' => 'STACKS-DS'
                    }
                  }
                }], 'classification' => {
                  'resource' => '/policy/classification', 'key' => 'LC'
                }
              },
              'naturalized_volumetric' => ['DVD', 'disc', 8.0]
            }, {
              'resource' => '/catalog/call',
              'key' => '7517385:10',
              'fields' => {
                'library' => {
                  'resource' => '/policy/library', 'key' => 'SHENANGO'
                }, 'callNumber' => 'PN1995.9.F36H377 2011', 'shadowed' => false, 'volumetric' => 'DVD disc.2', 'dispCallNumber' => 'PN1995.9.F36H377 2011 DVD disc.2', 'bib' => {
                  'resource' => '/catalog/bib', 'key' => '7517385'
                }, 'itemList' => [{
                  'resource' => '/catalog/item',
                  'key' => '7517385:10:1',
                  'fields' => {
                    'call' => {
                      'resource' => '/catalog/call', 'key' => '7517385:10'
                    }, 'mediaDesk' => nil, 'itemType' => {
                      'resource' => '/policy/itemType', 'key' => 'VIDEO'
                    }, 'library' => {
                      'resource' => '/policy/library', 'key' => 'SHENANGO'
                    }, 'shadowed' => false, 'homeLocation' => {
                      'resource' => '/policy/location', 'key' => 'MEDIA-SV'
                    }, 'copyNumber' => 1, 'bib' => {
                      'resource' => '/catalog/bib', 'key' => '7517385'
                    }, 'barcode' => '000074519859', 'circulate' => true, 'currentLocation' => {
                      'resource' => '/policy/location', 'key' => 'MEDIA-SV'
                    }
                  }
                }], 'classification' => {
                  'resource' => '/policy/classification', 'key' => 'LC'
                }
              },
              'naturalized_volumetric' => ['DVD', 'disc', 2.0]
            }, {
              'resource' => '/catalog/call',
              'key' => '7517385:11',
              'fields' => {
                'library' => {
                  'resource' => '/policy/library', 'key' => 'SHENANGO'
                }, 'callNumber' => 'PN1995.9.F36H377 2011', 'shadowed' => false, 'volumetric' => 'DVD disc.3', 'dispCallNumber' => 'PN1995.9.F36H377 2011 DVD disc.3', 'bib' => {
                  'resource' => '/catalog/bib', 'key' => '7517385'
                }, 'itemList' => [{
                  'resource' => '/catalog/item',
                  'key' => '7517385:11:1',
                  'fields' => {
                    'call' => {
                      'resource' => '/catalog/call', 'key' => '7517385:11'
                    }, 'mediaDesk' => nil, 'itemType' => {
                      'resource' => '/policy/itemType', 'key' => 'VIDEO'
                    }, 'library' => {
                      'resource' => '/policy/library', 'key' => 'SHENANGO'
                    }, 'shadowed' => false, 'homeLocation' => {
                      'resource' => '/policy/location', 'key' => 'MEDIA-SV'
                    }, 'copyNumber' => 1, 'bib' => {
                      'resource' => '/catalog/bib', 'key' => '7517385'
                    }, 'barcode' => '000074519620', 'circulate' => true, 'currentLocation' => {
                      'resource' => '/policy/location', 'key' => 'MEDIA-SV'
                    }
                  }
                }], 'classification' => {
                  'resource' => '/policy/classification', 'key' => 'LC'
                }
              },
              'naturalized_volumetric' => ['DVD', 'disc', 3.0]
            }, {
              'resource' => '/catalog/call',
              'key' => '7517385:12',
              'fields' => {
                'library' => {
                  'resource' => '/policy/library', 'key' => 'SHENANGO'
                }, 'callNumber' => 'PN1995.9.F36H377 2011', 'shadowed' => false, 'volumetric' => 'DVD disc.4', 'dispCallNumber' => 'PN1995.9.F36H377 2011 DVD disc.4', 'bib' => {
                  'resource' => '/catalog/bib', 'key' => '7517385'
                }, 'itemList' => [{
                  'resource' => '/catalog/item',
                  'key' => '7517385:12:1',
                  'fields' => {
                    'call' => {
                      'resource' => '/catalog/call', 'key' => '7517385:12'
                    }, 'mediaDesk' => nil, 'itemType' => {
                      'resource' => '/policy/itemType', 'key' => 'VIDEO'
                    }, 'library' => {
                      'resource' => '/policy/library', 'key' => 'SHENANGO'
                    }, 'shadowed' => false, 'homeLocation' => {
                      'resource' => '/policy/location', 'key' => 'MEDIA-SV'
                    }, 'copyNumber' => 1, 'bib' => {
                      'resource' => '/catalog/bib', 'key' => '7517385'
                    }, 'barcode' => '000074519774', 'circulate' => true, 'currentLocation' => {
                      'resource' => '/policy/location', 'key' => 'MEDIA-SV'
                    }
                  }
                }], 'classification' => {
                  'resource' => '/policy/classification', 'key' => 'LC'
                }
              },
              'naturalized_volumetric' => ['DVD', 'disc', 4.0]
            }, {
              'resource' => '/catalog/call',
              'key' => '7517385:13',
              'fields' => {
                'library' => {
                  'resource' => '/policy/library', 'key' => 'SHENANGO'
                }, 'callNumber' => 'PN1995.9.F36H377 2011', 'shadowed' => false, 'volumetric' => 'DVD disc.5', 'dispCallNumber' => 'PN1995.9.F36H377 2011 DVD disc.5', 'bib' => {
                  'resource' => '/catalog/bib', 'key' => '7517385'
                }, 'itemList' => [{
                  'resource' => '/catalog/item',
                  'key' => '7517385:13:1',
                  'fields' => {
                    'call' => {
                      'resource' => '/catalog/call', 'key' => '7517385:13'
                    }, 'mediaDesk' => nil, 'itemType' => {
                      'resource' => '/policy/itemType', 'key' => 'VIDEO'
                    }, 'library' => {
                      'resource' => '/policy/library', 'key' => 'SHENANGO'
                    }, 'shadowed' => false, 'homeLocation' => {
                      'resource' => '/policy/location', 'key' => 'MEDIA-SV'
                    }, 'copyNumber' => 1, 'bib' => {
                      'resource' => '/catalog/bib', 'key' => '7517385'
                    }, 'barcode' => '000074519583', 'circulate' => true, 'currentLocation' => {
                      'resource' => '/policy/location', 'key' => 'MEDIA-SV'
                    }
                  }
                }], 'classification' => {
                  'resource' => '/policy/classification', 'key' => 'LC'
                }
              },
              'naturalized_volumetric' => ['DVD', 'disc', 5.0]
            }, {
              'resource' => '/catalog/call',
              'key' => '7517385:14',
              'fields' => {
                'library' => {
                  'resource' => '/policy/library', 'key' => 'SHENANGO'
                }, 'callNumber' => 'PN1995.9.F36H377 2011 DVD', 'shadowed' => false, 'volumetric' => 'disc.6', 'dispCallNumber' => 'PN1995.9.F36H377 2011 DVD disc.6', 'bib' => {
                  'resource' => '/catalog/bib', 'key' => '7517385'
                }, 'itemList' => [{
                  'resource' => '/catalog/item',
                  'key' => '7517385:14:1',
                  'fields' => {
                    'call' => {
                      'resource' => '/catalog/call', 'key' => '7517385:14'
                    }, 'mediaDesk' => nil, 'itemType' => {
                      'resource' => '/policy/itemType', 'key' => 'VIDEO'
                    }, 'library' => {
                      'resource' => '/policy/library', 'key' => 'SHENANGO'
                    }, 'shadowed' => false, 'homeLocation' => {
                      'resource' => '/policy/location', 'key' => 'MEDIA-SV'
                    }, 'copyNumber' => 1, 'bib' => {
                      'resource' => '/catalog/bib', 'key' => '7517385'
                    }, 'barcode' => '000074519866', 'circulate' => true, 'currentLocation' => {
                      'resource' => '/policy/location', 'key' => 'MEDIA-SV'
                    }
                  }
                }], 'classification' => {
                  'resource' => '/policy/classification', 'key' => 'LC'
                }
              },
              'naturalized_volumetric' => ['disc', 6.0]
            }, {
              'resource' => '/catalog/call',
              'key' => '7517385:15',
              'fields' => {
                'library' => {
                  'resource' => '/policy/library', 'key' => 'SHENANGO'
                }, 'callNumber' => 'PN1995.9.F36H377 2011 DVD', 'shadowed' => false, 'volumetric' => 'disc.7', 'dispCallNumber' => 'PN1995.9.F36H377 2011 DVD disc.7', 'bib' => {
                  'resource' => '/catalog/bib', 'key' => '7517385'
                }, 'itemList' => [{
                  'resource' => '/catalog/item',
                  'key' => '7517385:15:1',
                  'fields' => {
                    'call' => {
                      'resource' => '/catalog/call', 'key' => '7517385:15'
                    }, 'mediaDesk' => nil, 'itemType' => {
                      'resource' => '/policy/itemType', 'key' => 'VIDEO'
                    }, 'library' => {
                      'resource' => '/policy/library', 'key' => 'SHENANGO'
                    }, 'shadowed' => false, 'homeLocation' => {
                      'resource' => '/policy/location', 'key' => 'MEDIA-SV'
                    }, 'copyNumber' => 1, 'bib' => {
                      'resource' => '/catalog/bib', 'key' => '7517385'
                    }, 'barcode' => '000074519767', 'circulate' => true, 'currentLocation' => {
                      'resource' => '/policy/location', 'key' => 'MEDIA-SV'
                    }
                  }
                }], 'classification' => {
                  'resource' => '/policy/classification', 'key' => 'LC'
                }
              },
              'naturalized_volumetric' => ['disc', 7.0]
            }, {
              'resource' => '/catalog/call',
              'key' => '7517385:16',
              'fields' => {
                'library' => {
                  'resource' => '/policy/library', 'key' => 'SHENANGO'
                }, 'callNumber' => 'PN1995.9.F36H377 2011 DVD', 'shadowed' => false, 'volumetric' => 'disc.8', 'dispCallNumber' => 'PN1995.9.F36H377 2011 DVD disc.8', 'bib' => {
                  'resource' => '/catalog/bib', 'key' => '7517385'
                }, 'itemList' => [{
                  'resource' => '/catalog/item',
                  'key' => '7517385:16:1',
                  'fields' => {
                    'call' => {
                      'resource' => '/catalog/call', 'key' => '7517385:16'
                    }, 'mediaDesk' => nil, 'itemType' => {
                      'resource' => '/policy/itemType', 'key' => 'VIDEO'
                    }, 'library' => {
                      'resource' => '/policy/library', 'key' => 'SHENANGO'
                    }, 'shadowed' => false, 'homeLocation' => {
                      'resource' => '/policy/location', 'key' => 'MEDIA-SV'
                    }, 'copyNumber' => 1, 'bib' => {
                      'resource' => '/catalog/bib', 'key' => '7517385'
                    }, 'barcode' => '000074519712', 'circulate' => true, 'currentLocation' => {
                      'resource' => '/policy/location', 'key' => 'MEDIA-SV'
                    }
                  }
                }], 'classification' => {
                  'resource' => '/policy/classification', 'key' => 'LC'
                }
              },
              'naturalized_volumetric' => ['disc', 8.0]
            }, {
              'resource' => '/catalog/call',
              'key' => '7517385:25',
              'fields' => {
                'library' => {
                  'resource' => '/policy/library', 'key' => 'ZREMOVED'
                }, 'callNumber' => 'PN1995.9.F36H377 2011', 'shadowed' => false, 'volumetric' => 'DVD disc.8', 'dispCallNumber' => 'PN1995.9.F36H377 2011 DVD disc.8', 'bib' => {
                  'resource' => '/catalog/bib', 'key' => '7517385'
                }, 'itemList' => [], 'classification' => {
                  'resource' => '/policy/classification', 'key' => 'LC'
                }
              }
            }], 'createDate' => '2011-11-01'
          }
        }
      }
    end

    factory :bib_with_bad_volumetric_data do
      initialize_with {
        new(body)
      }

      body {
        { 'resource' => '/catalog/bib',
          'key' => '2972255',
          'fields' =>
           { 'author' => 'Keeley, Page.',
             'catalogDate' => '2008-12-09',
             'createDate' => '2005-12-05',
             'createdBy' => 'HBG-TECH',
             'catalogFormat' => { 'resource' => '/policy/catalogFormat', 'key' => 'MARC' },
             'modifiedBy' => 'KAS11',
             'modifiedDate' => '2021-03-30',
             'shadowed' => false,
             'systemModifiedDate' => '2021-07-30T13:50:00-04:00',
             'title' => 'Uncovering student ideas in science',
             'titleControlNumber' => 'l2005018770',
             'bib' =>
             { 'standard' => 'MARC21',
               'type' => 'BIB',
               'leader' => '     cam a22     4a 4500',
               'fields' =>
               [{ 'tag' => '001', 'subfields' => [{ 'code' => '_', 'data' => 'a2972255' }] },
                { 'tag' => '003', 'subfields' => [{ 'code' => '_', 'data' => 'SIRSI' }] },
                { 'tag' => '005', 'subfields' => [{ 'code' => '_', 'data' => '20151215142910.0' }] },
                { 'tag' => '008', 'subfields' => [{ 'code' => '_', 'data' => '050701m20059999vaua     b    001 0 eng' }] },
                { 'tag' => '010', 'inds' => '  ', 'subfields' => [{ 'code' => 'a', 'data' => '  2005018770' }] },
                { 'tag' => '019', 'inds' => '  ', 'subfields' => [{ 'code' => 'a', 'data' => '176914768' }] },
                { 'tag' => '019', 'inds' => '  ', 'subfields' => [{ 'code' => 'a', 'data' => 'MARS' }] },
                { 'tag' => '020', 'inds' => '  ', 'subfields' => [{ 'code' => 'a', 'data' => '0873552555 (v. 1)' }] },
                { 'tag' => '020', 'inds' => '  ', 'subfields' => [{ 'code' => 'a', 'data' => '9780873552554 (v. 1)' }] },
                { 'tag' => '020', 'inds' => '  ', 'subfields' => [{ 'code' => 'a', 'data' => '9780873552738 (v. 2)' }] },
                { 'tag' => '020', 'inds' => '  ', 'subfields' => [{ 'code' => 'a', 'data' => '0873552733 (v. 2)' }] },
                { 'tag' => '020', 'inds' => '  ', 'subfields' => [{ 'code' => 'a', 'data' => '9781933531243 (v. 3)' }] },
                { 'tag' => '020', 'inds' => '  ', 'subfields' => [{ 'code' => 'a', 'data' => '193353124X (v. 3)' }] },
                { 'tag' => '020', 'inds' => '  ', 'subfields' => [{ 'code' => 'a', 'data' => '9781935155010 (v. 4)' }] },
                { 'tag' => '020', 'inds' => '  ', 'subfields' => [{ 'code' => 'a', 'data' => '1935155016 (v. 4)' }] },
                { 'tag' => '035', 'inds' => '  ', 'subfields' => [{ 'code' => 'a', 'data' => 'DE2542778' }] },
                { 'tag' => '035', 'inds' => '  ', 'subfields' => [{ 'code' => 'a', 'data' => '(OCoLC)60826525' }] },
                { 'tag' => '040',
                  'inds' => '  ',
                  'subfields' =>
                  [{ 'code' => 'a', 'data' => 'DLC' },
                   { 'code' => 'c', 'data' => 'DLC' },
                   { 'code' => 'd', 'data' => 'YDX' },
                   { 'code' => 'd', 'data' => 'BAKER' },
                   { 'code' => 'd', 'data' => 'BTCTA' },
                   { 'code' => 'd', 'data' => 'LVB' },
                   { 'code' => 'd', 'data' => 'YDXCP' },
                   { 'code' => 'd', 'data' => 'UtOrBLW' }] },
                { 'tag' => '042', 'inds' => '  ', 'subfields' => [{ 'code' => 'a', 'data' => 'pcc' }] },
                { 'tag' => '049', 'inds' => '  ', 'subfields' => [{ 'code' => 'a', 'data' => 'UPMM' }] },
                { 'tag' => '050', 'inds' => '00', 'subfields' => [{ 'code' => 'a', 'data' => 'Q181' }, { 'code' => 'b', 'data' => '.U438 2005' }] },
                { 'tag' => '082', 'inds' => '00', 'subfields' => [{ 'code' => 'a', 'data' => '507/.1' }, { 'code' => '2', 'data' => '22' }] },
                { 'tag' => '245', 'inds' => '00', 'subfields' => [{ 'code' => 'a', 'data' => 'Uncovering student ideas in science.' }] },
                { 'tag' => '264', 'inds' => ' 1', 'subfields' => [{ 'code' => 'a', 'data' => 'Arlington, Va. :' }, { 'code' => 'b', 'data' => 'NSTA Press,' }, { 'code' => 'c', 'data' => '[2005-]' }] },
                { 'tag' => '264', 'inds' => ' 4', 'subfields' => [{ 'code' => 'c', 'data' => '©2005-' }] },
                { 'tag' => '300', 'inds' => '  ', 'subfields' => [{ 'code' => 'a', 'data' => 'volumes :' }, { 'code' => 'b', 'data' => 'illustrations ;' }, { 'code' => 'c', 'data' => '28 cm' }] },
                { 'tag' => '336', 'inds' => '  ', 'subfields' => [{ 'code' => 'a', 'data' => 'text' }, { 'code' => 'b', 'data' => 'txt' }, { 'code' => '2', 'data' => 'rdacontent' }] },
                { 'tag' => '337', 'inds' => '  ', 'subfields' => [{ 'code' => 'a', 'data' => 'unmediated' }, { 'code' => 'b', 'data' => 'n' }, { 'code' => '2', 'data' => 'rdamedia' }] },
                { 'tag' => '338', 'inds' => '  ', 'subfields' => [{ 'code' => 'a', 'data' => 'volume' }, { 'code' => 'b', 'data' => 'nc' }, { 'code' => '2', 'data' => 'rdacarrier' }] },
                { 'tag' => '504', 'inds' => '  ', 'subfields' => [{ 'code' => 'a', 'data' => 'Includes bibliographical references and indexes.' }] },
                { 'tag' => '505',
                  'inds' => '1 ',
                  'subfields' =>
                  [{ 'code' => 'a',
                     'data' =>
                     'v. 1. 25 formative assessment probes / by Page Keeley, Francis Eberle, and Lynn Farrin -- v. 2. 25 more formative assessment probes / by Page Keeley, Francis Eberle, and Joyce Tugel -- v. 3. Another 25 formative assessment probes / by Page Keeley, Francis Eberle, and chad Ddorsey -- v. 4. 25 new formative assessment probes / by Page Keeley and Joyce Tugel.' }] },
                { 'tag' => '596', 'inds' => '  ', 'subfields' => [{ 'code' => 'a', 'data' => 'BERKS HARRISBURG ZREMOVED' }] },
                { 'tag' => '650', 'inds' => ' 0', 'subfields' => [{ 'code' => 'a', 'data' => 'Science' }, { 'code' => 'x', 'data' => 'Study and teaching.' }] },
                { 'tag' => '650', 'inds' => ' 0', 'subfields' => [{ 'code' => 'a', 'data' => 'Educational evaluation.' }] },
                { 'tag' => '700', 'inds' => '1 ', 'subfields' => [{ 'code' => 'a', 'data' => 'Keeley, Page.' }] },
                { 'tag' => '949',
                  'inds' => '  ',
                  'subfields' =>
                  [{ 'code' => 'a', 'data' => 'Q181.U438 2005' },
                   { 'code' => 'h', 'data' => 'DESTBK' },
                   { 'code' => 'i', 'data' => '000065265154' },
                   { 'code' => 'k', 'data' => 'STACKS-DE' },
                   { 'code' => 'l', 'data' => 'STACKS-DE' },
                   { 'code' => 'm', 'data' => 'BRANDYWINE' },
                   { 'code' => 'r', 'data' => 'C' },
                   { 'code' => 't', 'data' => 'BOOK' },
                   { 'code' => 'w', 'data' => 'LC' },
                   { 'code' => 's', 'data' => 'Yes' }] },
                { 'tag' => '949',
                  'inds' => '  ',
                  'subfields' =>
                  [{ 'code' => 'a', 'data' => 'Q181.U438 2005' },
                   { 'code' => 'h', 'data' => 'DESTBK' },
                   { 'code' => 'i', 'data' => '000065275061' },
                   { 'code' => 'k', 'data' => 'STACKS-DE' },
                   { 'code' => 'l', 'data' => 'STACKS-DE' },
                   { 'code' => 'm', 'data' => 'BRANDYWINE' },
                   { 'code' => 'r', 'data' => 'C' },
                   { 'code' => 't', 'data' => 'BOOK' },
                   { 'code' => 'w', 'data' => 'LC' },
                   { 'code' => 's', 'data' => 'Yes' }] },
                { 'tag' => '949',
                  'inds' => '  ',
                  'subfields' =>
                  [{ 'code' => 'a', 'data' => 'Q181.U438 2005' },
                   { 'code' => 'h', 'data' => 'HBCURBK' },
                   { 'code' => 'i', 'data' => '000063130867' },
                   { 'code' => 'k', 'data' => 'CURRIC-HB' },
                   { 'code' => 'l', 'data' => 'CURRIC-HB' },
                   { 'code' => 'm', 'data' => 'HARRISBURG' },
                   { 'code' => 'r', 'data' => 'C' },
                   { 'code' => 't', 'data' => 'INST MATERIAL' },
                   { 'code' => 'w', 'data' => 'LC' },
                   { 'code' => 's', 'data' => 'Yes' }] },
                { 'tag' => '949',
                  'inds' => '  ',
                  'subfields' =>
                  [{ 'code' => 'a', 'data' => 'Q181.K248 2005' },
                   { 'code' => 'h', 'data' => 'BKSTBK' },
                   { 'code' => 'i', 'data' => '000060962959' },
                   { 'code' => 'k', 'data' => 'STACKS-BK' },
                   { 'code' => 'l', 'data' => 'STACKS-BK' },
                   { 'code' => 'm', 'data' => 'BERKS' },
                   { 'code' => 'r', 'data' => 'C' },
                   { 'code' => 't', 'data' => 'BOOK' },
                   { 'code' => 'w', 'data' => 'LC' },
                   { 'code' => 's', 'data' => 'Yes' }] },
                { 'tag' => '949',
                  'inds' => '  ',
                  'subfields' =>
                  [{ 'code' => 'a', 'data' => 'Q181.U438 2005' },
                   { 'code' => 'h', 'data' => 'BKSTBK' },
                   { 'code' => 'i', 'data' => '000067148509' },
                   { 'code' => 'k', 'data' => 'STACKS-BK' },
                   { 'code' => 'l', 'data' => 'STACKS-BK' },
                   { 'code' => 'm', 'data' => 'BERKS' },
                   { 'code' => 'r', 'data' => 'C' },
                   { 'code' => 't', 'data' => 'BOOK' },
                   { 'code' => 'w', 'data' => 'LC' },
                   { 'code' => 's', 'data' => 'Yes' }] },
                { 'tag' => '949',
                  'inds' => '  ',
                  'subfields' =>
                  [{ 'code' => 'a', 'data' => 'BK3034516' },
                   { 'code' => 'w', 'data' => 'LC' },
                   { 'code' => 'm', 'data' => 'BERKS' },
                   { 'code' => 'k', 'data' => 'ON-ORDER' },
                   { 'code' => 'l', 'data' => 'ON-ORDER' },
                   { 'code' => 'o', 'data' => 'GOBI' },
                   { 'code' => 'r', 'data' => 'Y' },
                   { 'code' => 's', 'data' => 'Yes' },
                   { 'code' => 't', 'data' => 'BOOK' }] },
                { 'tag' => '949',
                  'inds' => '  ',
                  'subfields' =>
                  [{ 'code' => 'a', 'data' => 'Q181.U438 2005' },
                   { 'code' => 'h', 'data' => 'BKSTBK' },
                   { 'code' => 'i', 'data' => '000067148493' },
                   { 'code' => 'k', 'data' => 'STACKS-BK' },
                   { 'code' => 'l', 'data' => 'STACKS-BK' },
                   { 'code' => 'm', 'data' => 'BERKS' },
                   { 'code' => 'r', 'data' => 'C' },
                   { 'code' => 't', 'data' => 'BOOK' },
                   { 'code' => 'w', 'data' => 'LC' },
                   { 'code' => 's', 'data' => 'Yes' }] },
                { 'tag' => '949',
                  'inds' => '  ',
                  'subfields' =>
                  [{ 'code' => 'a', 'data' => 'BK2795345' },
                   { 'code' => 'w', 'data' => 'LC' },
                   { 'code' => 'm', 'data' => 'BERKS' },
                   { 'code' => 'k', 'data' => 'ON-ORDER' },
                   { 'code' => 'l', 'data' => 'ON-ORDER' },
                   { 'code' => 'o', 'data' => 'GOBI' },
                   { 'code' => 'r', 'data' => 'Y' },
                   { 'code' => 's', 'data' => 'Yes' },
                   { 'code' => 't', 'data' => 'BOOK' }] },
                { 'tag' => '980',
                  'inds' => '  ',
                  'subfields' =>
                  [{ 'code' => 'a', 'data' => '2008-12-04' },
                   { 'code' => 'e', 'data' => '35.95' },
                   { 'code' => 'f', 'data' => '574821' },
                   { 'code' => 'j', 'data' => 'PAPER' },
                   { 'code' => 'n', 'data' => 'YBPDE' },
                   { 'code' => 'x', 'data' => '528.75' }] },
                { 'tag' => '980',
                  'inds' => '  ',
                  'subfields' =>
                  [{ 'code' => 'a', 'data' => '2008-11-20' },
                   { 'code' => 'e', 'data' => '35.95' },
                   { 'code' => 'f', 'data' => '564699' },
                   { 'code' => 'j', 'data' => 'PAPER' },
                   { 'code' => 'n', 'data' => 'YBPDE' },
                   { 'code' => 'x', 'data' => '245.03' }] },
                { 'tag' => '980',
                  'inds' => '  ',
                  'subfields' =>
                  [{ 'code' => 'a', 'data' => '2008-02-14' },
                   { 'code' => 'e', 'data' => '34.95' },
                   { 'code' => 'f', 'data' => '341318' },
                   { 'code' => 'j', 'data' => 'PAPER' },
                   { 'code' => 'n', 'data' => 'YBPHA' },
                   { 'code' => 'x', 'data' => '924.34' }] },
                { 'tag' => '980',
                  'inds' => '  ',
                  'subfields' =>
                  [{ 'code' => 'a', 'data' => '2007-09-14' },
                   { 'code' => 'e', 'data' => '34.95' },
                   { 'code' => 'f', 'data' => '224155' },
                   { 'code' => 'j', 'data' => 'PAPER' },
                   { 'code' => 'n', 'data' => 'YBPBK' },
                   { 'code' => 'x', 'data' => '259.7' }] },
                { 'tag' => '980',
                  'inds' => '  ',
                  'subfields' =>
                  [{ 'code' => 'a', 'data' => '2009-09-10' },
                   { 'code' => 'e', 'data' => '27.95' },
                   { 'code' => 'f', 'data' => '792049' },
                   { 'code' => 'j', 'data' => 'PAPER' },
                   { 'code' => 'n', 'data' => 'YBPBK' },
                   { 'code' => 'x', 'data' => '277.72' }] }] },
             'callList' =>
             [{ 'resource' => '/catalog/call',
                'key' => '2972255:2',
                'fields' =>
                { 'bib' => { 'resource' => '/catalog/bib', 'key' => '2972255' },
                  'callNumber' => 'Q181.K248',
                  'volumetric' => '2005 v.1',
                  'dispCallNumber' => 'Q181.K248 2005 v.1',
                  'classification' => { 'resource' => '/policy/classification', 'key' => 'LC' },
                  'library' => { 'resource' => '/policy/library', 'key' => 'BERKS' },
                  'shadowed' => false,
                  'itemList' =>
                  [{ 'resource' => '/catalog/item',
                     'key' => '2972255:2:1',
                     'fields' =>
                     { 'bib' => { 'resource' => '/catalog/bib', 'key' => '2972255' },
                       'call' => { 'resource' => '/catalog/call', 'key' => '2972255:2' },
                       'barcode' => '000060963048',
                       'circulate' => true,
                       'copyNumber' => 1,
                       'currentLocation' => { 'resource' => '/policy/location', 'key' => 'INTRANSIT' },
                       'homeLocation' => { 'resource' => '/policy/location', 'key' => 'STACKS-BK' },
                       'itemType' => { 'resource' => '/policy/itemType', 'key' => 'BOOKFLOAT' },
                       'library' => { 'resource' => '/policy/library', 'key' => 'BERKS' },
                       'mediaDesk' => nil,
                       'shadowed' => false } }] } },
              { 'resource' => '/catalog/call',
                'key' => '2972255:5',
                'fields' =>
                { 'bib' => { 'resource' => '/catalog/bib', 'key' => '2972255' },
                  'callNumber' => 'Q181.K248',
                  'volumetric' => '2005 v.2',
                  'dispCallNumber' => 'Q181.K248 2005 v.2',
                  'classification' => { 'resource' => '/policy/classification', 'key' => 'LC' },
                  'library' => { 'resource' => '/policy/library', 'key' => 'BERKS' },
                  'shadowed' => false,
                  'itemList' =>
                  [{ 'resource' => '/catalog/item',
                     'key' => '2972255:5:1',
                     'fields' =>
                     { 'bib' => { 'resource' => '/catalog/bib', 'key' => '2972255' },
                       'call' => { 'resource' => '/catalog/call', 'key' => '2972255:5' },
                       'barcode' => '000062432382',
                       'circulate' => true,
                       'copyNumber' => 1,
                       'currentLocation' => { 'resource' => '/policy/location', 'key' => 'INTRANSIT' },
                       'homeLocation' => { 'resource' => '/policy/location', 'key' => 'STACKS-BK' },
                       'itemType' => { 'resource' => '/policy/itemType', 'key' => 'BOOKFLOAT' },
                       'library' => { 'resource' => '/policy/library', 'key' => 'BERKS' },
                       'mediaDesk' => nil,
                       'shadowed' => false } }] } },
              { 'resource' => '/catalog/call',
                'key' => '2972255:9',
                'fields' =>
                { 'bib' => { 'resource' => '/catalog/bib', 'key' => '2972255' },
                  'callNumber' => 'Q181.K248',
                  'volumetric' => '2005 v.3',
                  'dispCallNumber' => 'Q181.K248 2005 v.3',
                  'classification' => { 'resource' => '/policy/classification', 'key' => 'LC' },
                  'library' => { 'resource' => '/policy/library', 'key' => 'BERKS' },
                  'shadowed' => false,
                  'itemList' =>
                  [{ 'resource' => '/catalog/item',
                     'key' => '2972255:9:1',
                     'fields' =>
                     { 'bib' => { 'resource' => '/catalog/bib', 'key' => '2972255' },
                       'call' => { 'resource' => '/catalog/call', 'key' => '2972255:9' },
                       'barcode' => '000067148493',
                       'circulate' => true,
                       'copyNumber' => 1,
                       'currentLocation' => { 'resource' => '/policy/location', 'key' => 'INTRANSIT' },
                       'homeLocation' => { 'resource' => '/policy/location', 'key' => 'STACKS-BK' },
                       'itemType' => { 'resource' => '/policy/itemType', 'key' => 'BOOKFLOAT' },
                       'library' => { 'resource' => '/policy/library', 'key' => 'BERKS' },
                       'mediaDesk' => nil,
                       'shadowed' => false } }] } },
              { 'resource' => '/catalog/call',
                'key' => '2972255:8',
                'fields' =>
                { 'bib' => { 'resource' => '/catalog/bib', 'key' => '2972255' },
                  'callNumber' => 'Q181.K248',
                  'volumetric' => '2005 v.4',
                  'dispCallNumber' => 'Q181.K248 2005 v.4',
                  'classification' => { 'resource' => '/policy/classification', 'key' => 'LC' },
                  'library' => { 'resource' => '/policy/library', 'key' => 'BERKS' },
                  'shadowed' => false,
                  'itemList' =>
                  [{ 'resource' => '/catalog/item',
                     'key' => '2972255:8:1',
                     'fields' =>
                     { 'bib' => { 'resource' => '/catalog/bib', 'key' => '2972255' },
                       'call' => { 'resource' => '/catalog/call', 'key' => '2972255:8' },
                       'barcode' => '000067148509',
                       'circulate' => true,
                       'copyNumber' => 1,
                       'currentLocation' => { 'resource' => '/policy/location', 'key' => 'INTRANSIT' },
                       'homeLocation' => { 'resource' => '/policy/location', 'key' => 'STACKS-BK' },
                       'itemType' => { 'resource' => '/policy/itemType', 'key' => 'BOOKFLOAT' },
                       'library' => { 'resource' => '/policy/library', 'key' => 'BERKS' },
                       'mediaDesk' => nil,
                       'shadowed' => false } }] } },
              { 'resource' => '/catalog/call',
                'key' => '2972255:1',
                'fields' =>
                { 'bib' => { 'resource' => '/catalog/bib', 'key' => '2972255' },
                  'callNumber' => 'Q181.K248 2005',
                  'volumetric' => 'v.1',
                  'dispCallNumber' => 'Q181.K248 2005 v.1',
                  'classification' => { 'resource' => '/policy/classification', 'key' => 'LC' },
                  'library' => { 'resource' => '/policy/library', 'key' => 'HARRISBURG' },
                  'shadowed' => false,
                  'itemList' =>
                  [{ 'resource' => '/catalog/item',
                     'key' => '2972255:1:1',
                     'fields' =>
                     { 'bib' => { 'resource' => '/catalog/bib', 'key' => '2972255' },
                       'call' => { 'resource' => '/catalog/call', 'key' => '2972255:1' },
                       'barcode' => '000056197457',
                       'circulate' => true,
                       'copyNumber' => 1,
                       'currentLocation' => { 'resource' => '/policy/location', 'key' => 'CURRIC-HB' },
                       'homeLocation' => { 'resource' => '/policy/location', 'key' => 'CURRIC-HB' },
                       'itemType' => { 'resource' => '/policy/itemType', 'key' => 'INSTR-MATL' },
                       'library' => { 'resource' => '/policy/library', 'key' => 'HARRISBURG' },
                       'mediaDesk' => nil,
                       'shadowed' => false } }] } },
              { 'resource' => '/catalog/call',
                'key' => '2972255:10',
                'fields' =>
                { 'bib' => { 'resource' => '/catalog/bib', 'key' => '2972255' },
                  'callNumber' => 'Q181.K248 2005',
                  'volumetric' => 'v.4',
                  'dispCallNumber' => 'Q181.K248 2005 v.4',
                  'classification' => { 'resource' => '/policy/classification', 'key' => 'LC' },
                  'library' => { 'resource' => '/policy/library', 'key' => 'HARRISBURG' },
                  'shadowed' => false,
                  'itemList' =>
                  [{ 'resource' => '/catalog/item',
                     'key' => '2972255:10:1',
                     'fields' =>
                     { 'bib' => { 'resource' => '/catalog/bib', 'key' => '2972255' },
                       'call' => { 'resource' => '/catalog/call', 'key' => '2972255:10' },
                       'barcode' => '000066827948',
                       'circulate' => true,
                       'copyNumber' => 1,
                       'currentLocation' => { 'resource' => '/policy/location', 'key' => 'CURRIC-HB' },
                       'homeLocation' => { 'resource' => '/policy/location', 'key' => 'CURRIC-HB' },
                       'itemType' => { 'resource' => '/policy/itemType', 'key' => 'INSTR-MATL' },
                       'library' => { 'resource' => '/policy/library', 'key' => 'HARRISBURG' },
                       'mediaDesk' => nil,
                       'shadowed' => false } }] } },
              { 'resource' => '/catalog/call',
                'key' => '2972255:3',
                'fields' =>
                { 'bib' => { 'resource' => '/catalog/bib', 'key' => '2972255' },
                  'callNumber' => 'Q181.U438 2005',
                  'volumetric' => 'v.2',
                  'dispCallNumber' => 'Q181.U438 2005 v.2',
                  'classification' => { 'resource' => '/policy/classification', 'key' => 'LC' },
                  'library' => { 'resource' => '/policy/library', 'key' => 'HARRISBURG' },
                  'shadowed' => false,
                  'itemList' =>
                  [{ 'resource' => '/catalog/item',
                     'key' => '2972255:3:1',
                     'fields' =>
                     { 'bib' => { 'resource' => '/catalog/bib', 'key' => '2972255' },
                       'call' => { 'resource' => '/catalog/call', 'key' => '2972255:3' },
                       'barcode' => '000063130867',
                       'circulate' => true,
                       'copyNumber' => 1,
                       'currentLocation' => { 'resource' => '/policy/location', 'key' => 'CURRIC-HB' },
                       'homeLocation' => { 'resource' => '/policy/location', 'key' => 'CURRIC-HB' },
                       'itemType' => { 'resource' => '/policy/itemType', 'key' => 'INSTR-MATL' },
                       'library' => { 'resource' => '/policy/library', 'key' => 'HARRISBURG' },
                       'mediaDesk' => nil,
                       'shadowed' => false } }] } },
              { 'resource' => '/catalog/call',
                'key' => '2972255:11',
                'fields' =>
                { 'bib' => { 'resource' => '/catalog/bib', 'key' => '2972255' },
                  'callNumber' => 'Q181.U438 2005',
                  'volumetric' => nil,
                  'dispCallNumber' => 'Q181.U438 2005',
                  'classification' => { 'resource' => '/policy/classification', 'key' => 'LC' },
                  'library' => { 'resource' => '/policy/library', 'key' => 'ZREMOVED' },
                  'shadowed' => false,
                  'itemList' => [] } },
              { 'resource' => '/catalog/call',
                'key' => '2972255:12',
                'fields' =>
                { 'bib' => { 'resource' => '/catalog/bib', 'key' => '2972255' },
                  'callNumber' => 'Q181.U438 2005',
                  'volumetric' => 'v.2',
                  'dispCallNumber' => 'Q181.U438 2005 v.2',
                  'classification' => { 'resource' => '/policy/classification', 'key' => 'LC' },
                  'library' => { 'resource' => '/policy/library', 'key' => 'ZREMOVED' },
                  'shadowed' => false,
                  'itemList' => [] } }] } }
      }
    end

    factory :bib_with_multiple_non_volumetrics do
      initialize_with {
        new(body)
      }

      body {
        {
          'resource' => '/catalog/bib', 'key' => '15513', 'fields' => {
            'shadowed' => false, 'author' => 'Sangree, Anne C., editor.', 'titleControlNumber' => 'LIAS53120', 'catalogDate' => '1997-08-21', 'catalogFormat' => {
              'resource' => '/policy/catalogFormat', 'key' => 'MARC'
            }, 'modifiedDate' => '2019-05-26', 'systemModifiedDate' => '2020-02-13T11:20:00-05:00', 'title' => 'Elevations in Pennsylvania', 'callList' => [{
              'resource' => '/catalog/call',
              'key' => '15513:1',
              'fields' => {
                'library' => {
                  'resource' => '/policy/library', 'key' => 'HARRISBURG'
                }, 'callNumber' => 'QE157.S26x', 'shadowed' => false, 'volumetric' => nil, 'dispCallNumber' => 'QE157.S26x', 'bib' => {
                  'resource' => '/catalog/bib', 'key' => '15513'
                }, 'itemList' => [{
                  'resource' => '/catalog/item',
                  'key' => '15513:1:1',
                  'fields' => {
                    'call' => {
                      'resource' => '/catalog/call', 'key' => '15513:1'
                    }, 'mediaDesk' => nil, 'itemType' => {
                      'resource' => '/policy/itemType', 'key' => 'BOOKFLOAT'
                    }, 'library' => {
                      'resource' => '/policy/library', 'key' => 'HARRISBURG'
                    }, 'shadowed' => false, 'homeLocation' => {
                      'resource' => '/policy/location', 'key' => 'STACKS-HB3'
                    }, 'copyNumber' => 1, 'bib' => {
                      'resource' => '/catalog/bib', 'key' => '15513'
                    }, 'barcode' => '000058006191', 'circulate' => true, 'currentLocation' => {
                      'resource' => '/policy/location', 'key' => 'STACKS-HB3'
                    }
                  }
                }], 'classification' => {
                  'resource' => '/policy/classification', 'key' => 'LC'
                }
              },
              'naturalized_volumetric' => []
            }, {
              'resource' => '/catalog/call',
              'key' => '15513:9',
              'fields' => {
                'library' => {
                  'resource' => '/policy/library', 'key' => 'UP-MAPS'
                }, 'callNumber' => 'GB495.P4E4', 'shadowed' => false, 'volumetric' => nil, 'dispCallNumber' => 'GB495.P4E4', 'bib' => {
                  'resource' => '/catalog/bib', 'key' => '15513'
                }, 'itemList' => [{
                  'resource' => '/catalog/item',
                  'key' => '15513:9:1',
                  'fields' => {
                    'call' => {
                      'resource' => '/catalog/call', 'key' => '15513:9'
                    }, 'mediaDesk' => nil, 'itemType' => {
                      'resource' => '/policy/itemType', 'key' => 'BOOK'
                    }, 'library' => {
                      'resource' => '/policy/library', 'key' => 'UP-MAPS'
                    }, 'shadowed' => false, 'homeLocation' => {
                      'resource' => '/policy/location', 'key' => 'STACKS-MP'
                    }, 'copyNumber' => 1, 'bib' => {
                      'resource' => '/catalog/bib', 'key' => '15513'
                    }, 'barcode' => '000010591345', 'circulate' => true, 'currentLocation' => {
                      'resource' => '/policy/location', 'key' => 'STACKS-MP'
                    }
                  }
                }], 'classification' => {
                  'resource' => '/policy/classification', 'key' => 'LC'
                }
              },
              'naturalized_volumetric' => []
            }, {
              'resource' => '/catalog/call',
              'key' => '15513:6',
              'fields' => {
                'library' => {
                  'resource' => '/policy/library', 'key' => 'UP-EMS'
                }, 'callNumber' => 'QE157.P45', 'shadowed' => false, 'volumetric' => 'no.4', 'dispCallNumber' => 'QE157.P45 no.4', 'bib' => {
                  'resource' => '/catalog/bib', 'key' => '15513'
                }, 'itemList' => [{
                  'resource' => '/catalog/item',
                  'key' => '15513:6:1',
                  'fields' => {
                    'call' => {
                      'resource' => '/catalog/call', 'key' => '15513:6'
                    }, 'mediaDesk' => nil, 'itemType' => {
                      'resource' => '/policy/itemType', 'key' => 'BOOK'
                    }, 'library' => {
                      'resource' => '/policy/library', 'key' => 'UP-EMS'
                    }, 'shadowed' => false, 'homeLocation' => {
                      'resource' => '/policy/location', 'key' => 'STACKS-EM'
                    }, 'copyNumber' => 1, 'bib' => {
                      'resource' => '/catalog/bib', 'key' => '15513'
                    }, 'barcode' => '000022668905', 'circulate' => true, 'currentLocation' => {
                      'resource' => '/policy/location', 'key' => 'STACKS-EM'
                    }
                  }
                }], 'classification' => {
                  'resource' => '/policy/classification', 'key' => 'LC'
                }
              },
              'naturalized_volumetric' => ['no', 4.0]
            }, {
              'resource' => '/catalog/call',
              'key' => '15513:11',
              'fields' => {
                'library' => {
                  'resource' => '/policy/library', 'key' => 'ZREMOVED'
                }, 'callNumber' => 'GB495.P5E4', 'shadowed' => false, 'volumetric' => nil, 'dispCallNumber' => 'GB495.P5E4', 'bib' => {
                  'resource' => '/catalog/bib', 'key' => '15513'
                }, 'itemList' => [], 'classification' => {
                  'resource' => '/policy/classification', 'key' => 'LC'
                }
              }
            }, {
              'resource' => '/catalog/call',
              'key' => '15513:10',
              'fields' => {
                'library' => {
                  'resource' => '/policy/library', 'key' => 'ONLINE'
                }, 'callNumber' => 'Electronic resource', 'shadowed' => false, 'volumetric' => nil, 'dispCallNumber' => 'Electronic resource', 'bib' => {
                  'resource' => '/catalog/bib', 'key' => '15513'
                }, 'itemList' => [{
                  'resource' => '/catalog/item',
                  'key' => '15513:10:1',
                  'fields' => {
                    'call' => {
                      'resource' => '/catalog/call', 'key' => '15513:10'
                    }, 'mediaDesk' => nil, 'itemType' => {
                      'resource' => '/policy/itemType', 'key' => 'ONLINE'
                    }, 'library' => {
                      'resource' => '/policy/library', 'key' => 'ONLINE'
                    }, 'shadowed' => false, 'homeLocation' => {
                      'resource' => '/policy/location', 'key' => 'ONLINE'
                    }, 'copyNumber' => 1, 'bib' => {
                      'resource' => '/catalog/bib', 'key' => '15513'
                    }, 'barcode' => '15513-10001', 'circulate' => true, 'currentLocation' => {
                      'resource' => '/policy/location', 'key' => 'ONLINE'
                    }
                  }
                }], 'classification' => {
                  'resource' => '/policy/classification', 'key' => 'ASIS'
                }
              }
            }], 'createDate' => '2001-04-12'
          }
        }
      }
    end
  end
end
