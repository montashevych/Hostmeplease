require 'rails_helper'

RSpec.describe User do
  context 'when valid' do
    let(:valid_user) { build(:user) }
    it 'creates an default user' do
      expect(valid_user).to be_valid
    end

    let(:valid_user) { build(:user, role: 'owner') }
    it 'creates an user with owner role' do
      expect(valid_user).to be_valid
    end
  end

  context 'when not valid' do
    let(:unvalid_user) { build(:user, first_name: '    ' ) }
    it 'creates an user with space-name' do
      expect(unvalid_user).not_to be_valid
    end

    let(:unvalid_user) { build(:user, first_name: '1' * 100) }
    it 'creates an user with long name' do
      expect(unvalid_user).not_to be_valid
    end

    let(:unvalid_user) { build(:user, email: '') }
    it 'creates an user without email' do
      expect(unvalid_user).not_to be_valid
    end

    let(:unvalid_user) { build(:user, password: '') }
    it 'creates an user without password' do
      expect(unvalid_user).not_to be_valid
    end

    let(:unvalid_user) { build(:user, role: '') }
    it 'creates an user without role' do
      expect(unvalid_user).not_to be_valid
    end
  end
end

