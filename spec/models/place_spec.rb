require 'rails_helper'

RSpec.describe Place, type: :model do
  context 'when  valid' do
    let(:test_place) { build(:place) }

    it 'is valid with valid attributes' do
      expect(test_place).to be_valid
    end
  end

  context 'when length incorrect' do
    let(:long_description) { build(:place, description: 'q' * 601) }
    let(:test_place) { FactoryBot.build(:place) }

    it 'does not allow a title longer than 50 characters' do
      test_place.title = 'q' * 24
      expect(test_place).not_to be_valid
    end

    it 'does not allow a description longer than 600 characters' do
      test_place.description = 'q' * 601
      expect(test_place).not_to be_valid
    end
  end
end
