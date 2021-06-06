class Country < ApplicationRecord
  belongs_to :place
  has_one :city
end
