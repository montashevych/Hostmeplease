class Picture < ApplicationRecord
  mount_uploaders :image, ImageUploader

  validates :image, file_size: { less_than: 1.megabytes }
  validates :image, presence: true

  belongs_to :imageable, polymorphic: true
end
