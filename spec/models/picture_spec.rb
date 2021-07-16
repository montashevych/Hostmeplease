require 'rails_helper'

RSpec.describe Picture, type: :model do
  let!(:test_user) { FactoryBot.create(:user) }
  let!(:test_picture) { FactoryBot.build(:picture) }
  let(:test_address) { FactoryBot.build(:address) }
  let!(:test_place) {
    FactoryBot.create(:place, user: test_user,
                              pictures: [test_picture],
                              address: test_address)
  }

  before do
    test_picture.save!
  end

  after do
    test_picture.destroy
  end

  it 'is valid with valid attributes' do
    expect(test_picture).to be_valid
  end

  context 'when the user role changes to' do
    it 'owner' do
      expect(test_user.role).to eq('owner')
    end

    it 'consumer' do
      test_user.places.first.destroy
      expect(test_user.role).to eq('consumer')
    end
  end

  context 'without presence not valid' do
    it 'image' do
      test_picture.image = nil
      expect(test_picture).not_to be_valid
    end

    it 'imageable' do
      test_picture.imageable = nil
      expect(test_picture).not_to be_valid
    end

    it 'place reference' do
      test_place.destroy
      expect(test_picture).not_to be_valid
    end
  end
end
