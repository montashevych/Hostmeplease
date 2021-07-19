class Booking < ApplicationRecord
  belongs_to :place
  belongs_to :user

  validates :checkin, presence: true
  validates :checkout, presence: true
  validate :cannot_overlap_with_other_booking

  scope :with_overlapping_dates, lambda { |checkin, checkout|
    where(checkin: checkin...checkout).or(where(checkout: checkin...checkout))
      .where(confirmed: true)
  }

  scope :overlapping, lambda { |b|
    with_overlapping_dates(b.checkin, b.checkout)
      .where(place_id: b.place_id)
      .where.not(id: b.id)
      .where(confirmed: true)
  }

  def duration
    (checkout.to_date - checkin.to_date).to_i + 1
  end

  def full_price
    place.price * duration
  end

  def cannot_overlap_with_other_booking
    return unless Booking.overlapping(self).any?

    errors.add(:checkin, 'can\'t overlap with other booking')
    errors.add(:checkout, 'can\'t overlap with other booking')
  end
end
