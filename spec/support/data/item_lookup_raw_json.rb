# frozen_string_literal: true

ITEM_LOOKUP_RAW_JSON = {
  "resource": '/catalog/item',
  "key": '476022:229:1',
  "fields": {
    "itemCategory4": nil,
    "itemCategory3": nil,
    "itemCategory2": {
      "resource": '/policy/itemCategory2',
      "key": '7340'
    },
    "itemType": {
      "resource": '/policy/itemType',
      "key": 'PERIODICAL'
    },
    "itemCategory1": nil,
    "itemCategory5": nil,
    "systemModifiedDate": '2014-03-07T21:32:00-05:00',
    "circulate": true,
    "currentLocation": {
      "resource": '/policy/location',
      "key": 'CATO-2'
    },
    "call": {
      "resource": '/catalog/call',
      "key": '476022:229',
      "fields": {
        "library": {
          "resource": '/policy/library',
          "key": 'UP-ANNEX'
        },
        "callNumber": 'AP2.N3545',
        "shadowed": false,
        "volumetric": 'v.17 no.28-52 1965',
        "sortCallNumber": 'AP 000002 .N3545 V.000017 NO.000028-000052 001965',
        "dispCallNumber": 'AP2.N3545 v.17 no.28-52 1965',
        "bib": {
          "resource": '/catalog/bib',
          "key": '476022'
        },
        "classification": {
          "resource": '/policy/classification',
          "key": 'LCPER'
        },
        "systemModifiedDate": '2014-03-07T21:32:00-05:00'
      }
    },
    "mediaDesk": nil,
    "pieces": 1,
    "createdDate": '2010-06-17',
    "library": {
      "resource": '/policy/library',
      "key": 'UP-ANNEX'
    },
    "shadowed": false,
    "permanent": true,
    "price": {
      "currencyCode": 'USD',
      "amount": '0.00'
    },
    "homeLocation": {
      "resource": '/policy/location',
      "key": 'CATO-2'
    },
    "copyNumber": 1,
    "timesInventoried": 0,
    "lastInvDate": nil,
    "bib": {
      "resource": '/catalog/bib',
      "key": '476022',
      "fields": {
        "author": '',
        "title": 'National review'
      }
    },
    "barcode": 'not_holdable_barcode'
  }
}.freeze
