require 'rails_helper'

RSpec.describe Picture, type: :model do
  let(:test_picture) { FactoryBot.build(:picture) }
  let(:test_place) { FactoryBot.create(:place) }

  before do
    test_picture.imageable_id = test_place.id
    test_picture.save!
  end

  it 'is valid with valid attributes' do
    expect(test_picture).to be_valid
  end
end