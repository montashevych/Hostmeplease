class Address < ApplicationRecord
  validates :country, presence: true
  validates :city, presence: true
  validates :state_region, presence: true
  validates :details, presence: true

  belongs_to :place
end
