require 'rails_helper'
require 'factories/places'

RSpec.describe Place, type: :model do
  let(:place1) { create(:place) }

  it 'is valid with valid attributes' do
    expect(place1).to be_valid
  end
end
