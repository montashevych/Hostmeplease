class Place < ApplicationRecord
  belongs_to :user
  # has_many :pictures, as: :imageable
  enum status: { created: 0, updated: 1, approved: 2 }

  validates :title, presence: true, length: { maximum: 23 }
  validates :description, length: { maximum: 600 }
  validates :price, presence: true

  scope :workspaces, -> { where(type: 'Workspace') }
  scope :accommodations, -> { where(type: 'Accommodation') }
  # mount_uploader :picture_url, ImageUploader
end
