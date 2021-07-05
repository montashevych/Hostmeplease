require 'rails_helper'

RSpec.describe Booking, type: :model do
  let(:test_user)  { build :user }
  let(:test_place) { build :place, user: test_user }

  context 'when valid' do
    let(:test_booking) { build :booking, user: test_user, place: test_place, checkin: DateTime.now, checkout: DateTime.now + 7.days }
    let(:one_day_booking) { build :booking, user: test_user, place: test_place, checkin: DateTime.now + 8.days, checkout: DateTime.now + 8.days }

    it 'has valid attributes' do
      expect(test_booking).to be_valid
    end

    it 'can have equal checkin and checkout dates' do
      expect(one_day_booking).to be_valid
    end
  end

  context 'when invalid' do
    let(:booking_without_user) { build :booking, place: test_place, checkin: DateTime.now + 9.days, checkout: DateTime.now + 10.days }
    let(:booking_without_place) { build :booking, user: test_user, checkin: DateTime.now + 9.days, checkout: DateTime.now + 10.days }
    let(:booking_without_checkin) { build :booking, place: test_place, user: test_user, checkout: DateTime.now + 11.days }
    let(:booking_without_checkout) { build :booking, place: test_place, user: test_user, checkin: DateTime.now + 12.days }
    let(:overlapping_booking_1) { build :booking, user: test_user, place: test_place, checkin: DateTime.now + 13.days, checkout: DateTime.now + 50.days }
    let(:overlapping_booking_2) { build :booking, user: test_user, place: test_place, checkin: DateTime.now + 23.days, checkout: DateTime.now + 60.days }

    it 'does not have a user' do
      expect(booking_without_user).not_to be_valid
    end

    it 'does not have a place' do
      expect(booking_without_place).not_to be_valid
    end

    it 'does not have a checkin date' do
      expect(booking_without_checkin).not_to be_valid
    end

    it 'does not have a checkout date' do
      expect(booking_without_checkout).not_to be_valid
    end

    it 'overlaps with another booking' do
      # overlapping_booking_1.save! # don't save first, it'll cause validation errors in save!
      overlapping_booking_2.save!

      expect(overlapping_booking_1).not_to be_valid
    end
  end
end
