class Place < ApplicationRecord
  enum status: { created: 0, updated: 1, approved: 2 }

  validates :title, presence: true, length: { maximum: 23 }
  validates :description, length: { maximum: 600 }
  validates :price, presence: true

  scope :workspaces, -> { where(type: 'Workspace') }
  scope :accommodations, -> { where(type: 'Accommodation') }
end
