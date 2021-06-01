require 'rails_helper'
require 'factories/places'

RSpec.describe Place, type: :model do
  let(:test_place) { create(:place) }

  it 'is valid with valid attributes' do
    expect(test_place).to be_valid
  end
end
