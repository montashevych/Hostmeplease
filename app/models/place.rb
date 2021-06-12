class Place < ApplicationRecord
  SLICED_ATTRIBUTES = %w[country state city village road house_number].freeze

  enum status: { created: 0, updated: 1, approved: 2 }

  validates :title, presence: true, length: { maximum: 23 }
  validates :description, length: { maximum: 600 }
  validates :price, presence: true
  validates :lon, presence: true
  validates :lat, presence: true

  scope :workspaces, -> { where(type: 'Workspace') }
  scope :accommodations, -> { where(type: 'Accommodation') }

  reverse_geocoded_by :lat, :lon do |obj, results|
    if (geo = results.first.data)
      words = geo.extract!('address').values.first.extract!(*SLICED_ATTRIBUTES)
      obj.address = words.values.join(', ')
    end
  end

  after_validation :reverse_geocode
end
