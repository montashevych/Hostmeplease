require 'rails_helper'

RSpec.describe Address, type: :model do
  let(:test_user) { FactoryBot.build(:user) }
  let(:test_place) { FactoryBot.create(:place, user: test_user) }
  let(:test_address) { FactoryBot.build(:address, place: test_place) }

  it 'is valid with valid attributes' do
    expect(test_address).to be_valid
  end

  context 'when not valid address' do
    it 'returns a country presence error' do
      test_address.country = ''
      expect(test_address).not_to be_valid
    end

    it 'returns a place presence error' do
      test_address.place = nil
      expect(test_address).not_to be_valid
    end
  end
end
