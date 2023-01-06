# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HoldsHelper, type: :helper do
  let(:hold) do
    instance_double(
      Hold,
      title: 'Test Title',
      catkey: 123
    )
  end
  let(:arbitrary_datetime) { DateTime.new(2001, 2, 3) }
  let(:arbitrary_datetime_plus) { arbitrary_datetime + 14.days }

  describe '#render_queue_position' do
    context 'when there is a queue_position present' do
      before do
        allow(hold).to receive_messages(queue_position: 10)
      end

      it 'renders some pretext and then the position' do
        expect(helper.render_queue_position(hold)).to eq '10th'
      end
    end

    context 'when there is not a queue_position present' do
      before do
        allow(hold).to receive_messages(queue_position: nil)
      end

      it 'renders unknown' do
        expect(helper.render_queue_position(hold)).to eq 'Unknown'
      end
    end
  end

  describe '#render_hold_date' do
    context 'when there is an expiration date present' do
      before do
        expiration_date = DateTime.new(2025, 2, 3, 4, 5, 6)
        allow(hold).to receive_messages(expiration_date: expiration_date)
      end

      it 'renders some pretext and then the position' do
        expect(helper.render_hold_date(hold, date_field: 'expiration_date')).to eq 'February 3, 2025'
      end
    end

    context 'when there is not a expiration date present' do
      before do
        allow(hold).to receive_messages(expiration_date: nil)
      end

      it 'renders never expires' do
        expect(helper.render_hold_date(hold, date_field: 'expiration_date')).to eq 'Never expires'
      end
    end

    context 'when there is an fill by date present' do
      before do
        fill_by_date = DateTime.new(2025, 2, 3, 4, 5, 6)
        allow(hold).to receive_messages(fill_by_date: fill_by_date)
      end

      it 'renders some pretext and then the position' do
        expect(helper.render_hold_date(hold, date_field: 'fill_by_date')).to eq 'February 3, 2025'
      end
    end

    context 'when there is not a fill by date present' do
      before do
        allow(hold).to receive_messages(fill_by_date: nil)
      end

      it 'renders never expires' do
        expect(helper.render_hold_date(hold, date_field: 'fill_by_date')).to eq 'Never expires'
      end
    end
  end

  describe '#render_status' do
    context 'when the hold is suspended' do
      before do
        suspend_begin_date = DateTime.new(2026, 4, 3, 4, 5, 6)
        allow(hold).to receive_messages(status_code: 'SUSPENDED')
        allow(hold).to receive_messages(suspend_begin_date: suspend_begin_date)
      end

      context 'when there is a suspended beginning and end date' do
        before do
          suspend_end_date = DateTime.new(2026, 4, 24, 4, 5, 6)
          allow(hold).to receive_messages(suspend_end_date: suspend_end_date)
        end

        it 'renders some pretext and a date range' do
          expect(helper.render_status(hold)).to eq '<em>Suspended from</em>: April 3, 2026 - April 24, 2026'
        end
      end

      context 'when there is only a suspended beginning date' do
        before do
          allow(hold).to receive_messages(suspend_end_date: nil)
        end

        it 'renders inactive' do
          expect(helper.render_status(hold)).to eq 'Inactive'
        end
      end
    end

    context 'when the hold is active' do
      before do
        allow(hold).to receive_messages(status_code: 'BEING_HELD')
      end

      it 'renders active' do
        expect(helper.render_status(hold)).to eq 'Active'
      end
    end
  end

  context 'when dealing with date and time' do
    before do
      # Instantiate two instances of DateTime before it is doubled.
      arbitrary_datetime
      arbitrary_datetime_plus
      date_time = class_double('DateTime')
        .as_stubbed_const(transfer_nested_constants: true)
      allow(date_time).to receive(:now).and_return arbitrary_datetime
      allow(date_time).to receive(:civil).with(2001, 2, 17, 0, 0, (0 / 1), (0 / 1), 2299161.0)
        .and_return arbitrary_datetime_plus
    end

    describe '#default_pickup_by_date' do
      context 'when provided given an argument of make_default is true' do
        it 'sets the default pickup time to 14 days months from today' do
          expect(helper.default_pickup_by_date(make_default: true)).to eq '2001-02-17'
        end
      end

      context 'when given an argument of make_default is false' do
        it 'does not set a default value by returning an empty string' do
          expect(helper.default_pickup_by_date(make_default: false)).to eq ''
        end
      end
    end

    describe '#minimum_pickup_by_date' do
      it 'sets the minimum pickup time to today' do
        expect(helper.minimum_pickup_by_date).to eq '2001-02-03'
      end
    end
  end

  describe '#render_pickup_library' do
    it 'returns an html select list with the patron\s default library selected' do
      expect(helper.render_pickup_libraries('UP-PAT')).to include '<option selected="selected" value="UP-PAT">'\
                                            'Pattee and Paterno Library - Commons Services Desk</option>'
    end

    it 'returns an html select list with a blank option as selected when selected is not a pickup location' do
      expect(helper.render_pickup_libraries('not-a-pickup-location')).to include '<option selected="selected" '\
                                            'disabled="disabled" value="">Please choose a pickup location</option>'
    end

    it 'returns an html select list with a blank option as selected when selected is empty' do
      expect(helper.render_pickup_libraries('')).to include '<option selected="selected" '\
                                            'disabled="disabled" value="">Please choose a pickup location</option>'
    end
  end
end
