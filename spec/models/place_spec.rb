require 'rails_helper'
require 'factories/places'

RSpec.describe Place, type: :model do

  before(:all) do
    @place = create(:place)
  end
  
  it "is valid with valid attributes" do
    expect(@place).to be_valid
  end
end
