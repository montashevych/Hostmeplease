class Place < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 600 }
  validates :price, presence: true

  scope :workspaces, -> { where(type: 'Workspace') }
  scope :accommodations, -> { where(type: 'Accommodation') }
end
