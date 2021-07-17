module PlacesHelper
  def full_address(address_hash)
    string = "#{address_hash.country}, "
    string += "#{address_hash.city}, "
    string += "#{address_hash.state_region}, "
    string + address_hash.details
  end
end
