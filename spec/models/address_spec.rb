require 'rails_helper'

RSpec.describe Address, type: :model do
  let(:test_user) { FactoryBot.build(:user) }
  let(:test_address) { FactoryBot.build(:address) }
  let(:test_picture) { FactoryBot.build(:picture) }
  let(:test_place) {
    FactoryBot.create(:place, user: test_user,
                              address: test_address,
                              pictures: [test_picture])
  }

  context 'with valid' do
    it 'attributes' do
      test_address.place = test_place
      expect(test_address).to be_valid
    end
  end

  context 'without presence not valid' do
    it 'a country' do
      test_address.country = ''
      expect(test_address).not_to be_valid
    end

    it 'a city' do
      test_address.city = ''
      expect(test_address).not_to be_valid
    end

    it 'a state_region' do
      test_address.state_region = ''
      expect(test_address).not_to be_valid
    end

    it 'a details' do
      test_address.details = ''
      expect(test_address).not_to be_valid
    end

    it 'a place reference' do
      test_address.place = nil
      expect(test_address).not_to be_valid
    end

    it 'a longitude' do
      test_address.lon = nil
      expect(test_address).not_to be_valid
    end

    it 'a latitude' do
      test_address.lat = nil
      expect(test_address).not_to be_valid
    end
  end
end
