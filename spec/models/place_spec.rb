require 'rails_helper'
require 'factories/places'

RSpec.describe Place, type: :model do
  let(:test_place) { FactoryBot.build(:place) }

  it 'is valid with valid attributes' do
    expect(test_place).to be_valid
  end

  describe 'length validations' do
    it 'does not allow a title longer than 50 characters' do
      expect(FactoryBot.build(:place, title: 'q' * 51)).not_to be_valid
    end

    it 'does not allow a description longer than 600 characters' do
      expect(FactoryBot.build(:place, description: 'q' * 601)).not_to be_valid
    end
  end
end
