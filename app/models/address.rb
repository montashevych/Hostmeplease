class Address < ApplicationRecord
  belongs_to :place

  validates :country, presence: true
  validates :city, presence: true
  validates :state_region, presence: true
  validates :details, presence: true
  validates :lon, presence: true
  validates :lat, presence: true
end
