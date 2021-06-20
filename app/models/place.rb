class Place < ApplicationRecord
  enum status: { created: 0, updated: 1, approved: 2 }

  validates :title, presence: true, length: { maximum: 23 }
  validates :description, length: { maximum: 600 }
  validates :price, presence: true
  validates :lon, presence: true
  validates :lat, presence: true

  scope :workspaces, -> { where(type: 'Workspace') }
  scope :accommodations, -> { where(type: 'Accommodation') }

  belongs_to :user, optional: true
  has_one :address, dependent: :destroy

  accepts_nested_attributes_for :address
  # geocoded_by full_address(@address) do |obj, results|
  #   if (geo = results.first)
  #     obj.lat = geo.latitude
  #     obj.lon = geo.longitude
  #   end
  # end
  #
  # after_validation :geocode
end
