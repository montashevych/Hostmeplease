module PlacesHelper
  def address(place)
    data = Geocoder.search([place.lon, place.lat]).first.data
    str = data.extract!('address').values.first.extract!('country',
                                                         'state',
                                                         'city',
                                                         'village',
                                                         'road',
                                                         'house_number')
    str.values.join(', ')
  end
end
