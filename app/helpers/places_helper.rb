module PlacesHelper
  def address(plc)
    data = Geocoder.search([plc.lon, plc.lat]).first.data
    str = data.extract!('address').values.first.extract!('country',
                                                           'state',
                                                           'city',
                                                           'village',
                                                           'road',
                                                           'house_number')
    str.values.join(', ')
  end
end
