require 'rails_helper'

RSpec.describe PlacesHelper do
  include described_class

  let(:test_user) { create(:user, :confirmed) }
  let!(:test_address) { build(:address) }
  let!(:test_picture) { build(:picture) }
  let(:test_place) {
    create(:place, user: test_user,
                   address: test_address,
                   pictures: test_picture)
  }

  it 'returns valid full address' do
    address = full_address(test_address)
    expect(address) == 'UA, Rivne, Rivnen\'ska oblast, Kurchatova, 18Б'
  end
end
