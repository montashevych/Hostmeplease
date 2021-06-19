class Address < ApplicationRecord
  belongs_to :places, optional: true
end
