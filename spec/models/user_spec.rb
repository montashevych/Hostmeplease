require 'rails_helper'

RSpec.describe User do
  context 'when user registrate' do

    it 'is valid with valid attributes' do
      user2 = build(:user)
      expect(user2).to be_valid
    end

    it 'name should be present' do
      user2 = build(:user, first_name: '     ')
      expect(user2).not_to be_valid
    end

    it 'name should not be too long' do
      user2 = build(:user, first_name: '1' * 100)
      expect(user2).not_to be_valid
    end

    it 'email should be present' do
      user2 = build(:user, email: '')
      expect(user2).not_to be_valid
    end

    it 'password should be present' do
      user2 = build(:user, password: '')
      expect(user2).not_to be_valid
    end

    it 'has a unique email' do
      user2 = build(:user, email: 'bob@gmail.com')
      expect(user2).to be_valid
    end

    it 'is not valid without a password' do
      user2 = build(:user, password: nil)
      expect(user2).not_to be_valid
    end

    it 'is not valid without an email' do
      user2 = build(:user, email: nil)
      expect(user2).not_to be_valid
    end
  end
  context "when user login"
  end
end
