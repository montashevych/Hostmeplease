require 'rails_helper'

RSpec.describe User do
  context 'when valid' do
    it 'creates an default user' do
      valid_user = build(:user)
      expect(valid_user).to be_valid
    end

    it 'creates an user with owner role' do
      valid_user = build(:user, role: 'owner')
      expect(valid_user).to be_valid
    end
  end

  context 'when not valid' do
    it 'creates an user with space-name' do
      unvalid_user = build(:user, first_name: '     ')
      expect(unvalid_user).not_to be_valid
    end

    it 'creates an user with long name' do
      unvalid_user = build(:user, first_name: '1' * 100)
      expect(unvalid_user).not_to be_valid
    end

    it 'creates an user without email' do
      unvalid_user = build(:user, email: '')
      expect(unvalid_user).not_to be_valid
    end

    it 'creates an user without password' do
      unvalid_user = build(:user, password: '')
      expect(unvalid_user).not_to be_valid
    end

    it 'creates an user without role' do
      unvalid_user = build(:user, role: '')
      expect(unvalid_user).not_to be_valid
    end
  end
end
