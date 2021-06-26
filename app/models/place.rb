class Place < ApplicationRecord
  enum status: { created: 0, updated: 1, approved: 2 }

  validates :title, presence: true, length: { minimum: 8, maximum: 23 }
  validates :description, presence: true, length: { minimum: 10, maximum: 600 }
  # for production must change description minimum to 100 characters
  validates :price, presence: true
  validates :lon, presence: true
  validates :lat, presence: true

  scope :workspaces, -> { where(type: 'Workspace') }
  scope :accommodations, -> { where(type: 'Accommodation') }

  belongs_to :user, optional: true
  has_one :address, dependent: :destroy
  has_many :pictures, as: :imageable, dependent: :destroy

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :pictures
  # geocoded_by full_address(@address) do |obj, results|
  #   if (geo = results.first)
  #     obj.lat = geo.latitude
  #     obj.lon = geo.longitude
  #   end
  # end
  #
  # after_validation :geocode
end
