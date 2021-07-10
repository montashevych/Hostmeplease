require 'rails_helper'

RSpec.describe Address, type: :model do
  let(:test_user) { FactoryBot.build(:user) }
  let(:test_place) { FactoryBot.create(:place, user: test_user) }
  let(:test_address) { FactoryBot.build(:address, place: test_place) }

  it 'is valid with valid attributes' do
    expect(test_address).to be_valid
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
  end
end
