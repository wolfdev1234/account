# frozen_string_literal: true

HOLD_LOOKUP_NIL_ITEM_RAW_JSON = {
  "resource": '/circulation/holdRecord',
  "key": 'a_hold_key',
  "fields": {
    "pickupLibrary": {
      "resource": '/policy/library',
      "key": 'UP-PAT'
    },
    "item": nil,
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
    },
    "comment": '',
    "holdType": 'TITLE',
    "placedDate": '2020-02-12',
    "suspendBeginDate": nil,
    "expirationDate": nil,
    "status": 'PLACED'
  }
}.freeze
