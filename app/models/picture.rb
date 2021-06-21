class Picture < ApplicationRecord
  validates :image, file_size: { less_than: 1.megabytes }

  belongs_to :imageable, polymorphic: true
end
