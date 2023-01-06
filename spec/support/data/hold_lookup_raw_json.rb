# frozen_string_literal: true
# @todo: replace all implementations of this fake with the symphony sinatra fake
HOLD_LOOKUP_RAW_JSON = {
  "resource": '/circulation/holdRecord',
  "key": 'a_hold_key',
  "fields": {
    "pickupLibrary": {
      "resource": '/policy/library',
      "key": 'UP-PAT'
    },
    "item": {
      "resource": '/catalog/item',
      "key": '476022:171:1',
      "fields": {
        "call": {
          "resource": '/catalog/call',
          "key": '476022:171',
          "fields": {
            "library": {
              "resource": '/policy/library',
              "key": 'UP-PAT'
            },
            "callNumber": 'AP2.N3545',
            "shadowed": false,
            "volumetric": 'v.38 no.5-11 1986',
            "sortCallNumber": 'AP 000002 .N3545 V.000038 NO.000005-000011 001986',
            "dispCallNumber": 'AP2.N3545 v.38 no.5-11 1986',
            "bib": {
              "resource": '/catalog/bib',
              "key": '476022'
            },
            "classification": { "resource": '/policy/classification', "key": 'LCPER' },
            "systemModifiedDate": '2014-03-07T21:32:00-05:00'
          }
        },
        "bib": {
          "resource": '/catalog/bib',
          "key": '476022',
          "fields": {
            "author": '',
            "title": 'National review'
          }
        }
      }
    },
    "patron": {
      "resource": '/user/patron',
      "key": '18511'
    },
    "queueLength": 7,
    "reserveHold": false,
    "queuePosition": 5,
    "selectedItem": {
      "resource": '/catalog/item',
      "key": '476022:171:1'
    },
    "inactiveReason": nil,
    "placedWithOverride": false,
    "alternateHoldID": '',
    "fillByDate": '2020-04-12',
    "noticeDate": nil,
    "inactiveDate": nil,
    "placedLibrary": {
      "resource": '/policy/library',
      "key": 'UP-PAT'
    },
    "suspendEndDate": nil,
    "beingHeldDate": nil,
    "holdRange": {
      "resource": '/policy/holdRange',
      "key": 'SYSTEM'
    },
    "bib": {
      "resource": '/catalog/bib',
      "key": '476022',
      "fields": {
        "author": '',
        "title": 'National review'
      }
    },
    "comment": '',
    "holdType": 'TITLE',
    "placedDate": '2020-02-12',
    "suspendBeginDate": nil,
    "expirationDate": nil,
    "status": 'PLACED'
  }
}.freeze
