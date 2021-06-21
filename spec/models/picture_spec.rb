require 'rails_helper'

RSpec.describe Picture, type: :model do
  let(:test_picture) { FactoryBot.build(:picture) }

  it 'is valid with valid attributes' do
    expect(test_picture).to be_valid
  end
end
