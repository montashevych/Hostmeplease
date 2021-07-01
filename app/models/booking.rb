class Booking < ApplicationRecord
  belongs_to :place
  belongs_to :user

  validates :checkin, presence: true
  validates :checkout, presence: true

  scope :with_overlapping_dates, ->(checkin, checkout) {
    where(checkin: checkin...checkout).or(where(checkout: checkin...checkout))
  }

  scope :overlapping, ->(b) {
    with_overlapping_dates(b.checkin, b.checkout)
      .where(place_id: b.place_id)
      .where.not(id: b.id)
  }

  def duration
    ((checkout.to_date - checkin.to_date).to_i) + 1
  end

  def full_price
    place.price * duration
  end
end
