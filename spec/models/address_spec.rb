require 'rails_helper'

RSpec.describe Address, type: :model do
  let(:test_address) { FactoryBot.build(:address) }

  it 'is valid with valid attributes' do
    expect(test_address).to be_valid
  end

  context 'when not valid address' do
    it 'returns country validation error' do
      test_address.country = ''
      expect(test_address).not_to be_valid
    end
  end
end
