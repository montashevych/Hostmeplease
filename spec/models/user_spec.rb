require 'rails_helper'

RSpec.describe User do
  context 'when valid' do
    let(:valid_user) { build(:user, first_name: 'a' * 4) }
    let(:valids_user) { build(:user, role: 'owner') }

    it 'creates an default user' do
      expect(valid_user).to be_valid
    end

    it 'creates an user with owner role' do
      expect(valids_user).to be_valid
    end
  end

  context 'when not valid' do
    let(:unvalid1_user) { build(:user, first_name: '    ') }
    let(:unvalid2_user) { build(:user, first_name: '1' * 100) }
    let(:unvalid3_user) { build(:user, email: '') }
    let(:unvalid4_user) { build(:user, password: '') }
    let(:unvalid5_user) { build(:user, role: '') }

    it 'creates an user with space-name' do
      expect(unvalid1_user).not_to be_valid
    end

    it 'creates an user with long name' do
      expect(unvalid2_user).not_to be_valid
    end

    it 'creates an user without email' do
      expect(unvalid3_user).not_to be_valid
    end

    it 'creates an user without password' do
      expect(unvalid4_user).not_to be_valid
    end

    it 'creates an user without role' do
      expect(unvalid5_user).not_to be_valid
    end
  end
end
