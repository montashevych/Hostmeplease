module PlacesHelper
  SLICED_ATTRIBUTES = %w[country state city village road house_number].freeze

  def full_address(place)
    data = Geocoder.search([place.lon, place.lat]).first.data
    str = data.extract!('address').values.first.extract!(*SLICED_ATTRIBUTES)
    str.values.join(', ')
  end
end
