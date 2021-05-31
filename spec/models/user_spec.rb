require 'rails_helper'

RSpec.describe User do
  context "When User registrate" do

    it "is valid with valid attributes" do
      user1 = User.new(first_name: "James")
      user1.validate
      expect(user1.errors[:email]).not_to include("can't be blank") 
    end

    it "name should be present" do
      user = @user.first_name = "     "
      expect(user).not_to be_valid?
    end

    it "name should not be too long" do
      user = @user.first_name = "a" * 51
      expect(user).not_to be_valid?
    end

    it "email should be present" do
      user = @user.email = ""
      expect(user).to be_valid?
    end

     it "password should be present" do
      user = @user.password = ""
      expect(user).to be_valid?
    end

    it "has a unique email" do
      user2 = build(:user, email: "bob@gmail.com")
      expect(user2).not_to be_valid
    end

    it "is not valid without a password" do
      user2 = build(:user, password: nil)
      expect(user2).not_to be_valid
    end

    it "is not valid without an email" do
      user2 = build(:user, email: nil)
      expect(user2).not_to be_valid
    end

    
  end
end
