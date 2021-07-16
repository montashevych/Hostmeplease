require 'rails_helper'

RSpec.describe Place, type: :model do
  let(:test_user) { FactoryBot.build(:user) }
  let(:test_address) { FactoryBot.build(:address) }
  let(:test_picture) { FactoryBot.build(:picture) }
  let(:test_place) do
    FactoryBot.create(:place, user: test_user,
                              address: test_address,
                              pictures: [test_picture])
  end

  context 'when  valid' do
    it 'is valid with valid attributes' do
      expect(test_place).to be_valid
    end
  end

  context 'when length incorrect' do
    it 'does not allow a title longer than 50 characters' do
      test_place.title = 'q' * 24
      expect(test_place).not_to be_valid
    end

    it 'does not allow a title shorter than 7 characters' do
      test_place.title = 'q' * 7
      expect(test_place).not_to be_valid
    end

    it 'does not allow a description longer than 900 characters' do
      test_place.description = 'q' * 901
      expect(test_place).not_to be_valid
    end

    it 'does not allow a description shorter than 100 characters' do
      test_place.description = 'q' * 99
      expect(test_place).not_to be_valid
    end
  end

  context 'without relation' do
    it 'to user not valid' do
      test_place.user = nil
      expect(test_place).not_to be_valid
    end

    it 'to address not valid' do
      test_place.address = nil
      expect(test_place).not_to be_valid
    end

    it 'to pictures not valid' do
      test_place.pictures.delete_all
      expect(test_place).not_to be_valid
    end
  end
end
