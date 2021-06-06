class Place < ApplicationRecord
    validates :title, presence: true, length: { maximum: 45 }
    validates :description, length: {maximum:600}
    validates :price, presence: true
end
