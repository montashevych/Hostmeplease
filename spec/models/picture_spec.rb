require 'rails_helper'

RSpec.describe Picture, type: :model do
  let!(:test_user) { FactoryBot.create(:user) }
  let!(:test_picture) { FactoryBot.build(:picture) }
  let!(:test_place) { FactoryBot.create(:place, user: test_user) }

  before do
    test_picture.imageable_id = test_place.id
    test_picture.save!
  end

  after do
    test_picture.destroy
  end

  it 'is valid with valid attributes' do
    expect(test_picture).to be_valid
  end

  it 'change role to owner' do
    expect(test_user.role).to eq('owner')
  end

  it 'change user\'s role to consumer' do
    test_user.places.first.destroy
    expect(test_user.role).to eq('consumer')
  end
end
