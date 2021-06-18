require 'rails_helper'

RSpec.describe User do
  context 'when valid' do
    let(:test_user) { FactoryBot.build(:user, role: 'owner') }

    it 'creates an user with owner role' do
      expect(test_user).to be_valid
    end
  end

  context 'when not valid' do
    let(:test_user) { FactoryBot.build(:user) }

    it 'creates an default user with indication name' do
      test_user.first_name = 'a'
      expect(test_user).not_to be_valid
    end

    it 'creates an user with long name' do
      test_user.first_name = '1' * 51
      expect(test_user).not_to be_valid
    end

    it 'creates an user without email' do
      test_user.email = ''
      expect(test_user).not_to be_valid
    end

    it 'creates an user without role' do
      test_user.role = ''
      expect(test_user).not_to be_valid
    end
  end

  context 'when not valid password' do
    let(:test_user) { FactoryBot.build(:user) }

    it 'creates an user with long password' do
      test_user.password = '1' * 256
      expect(test_user).not_to be_valid
    end

    it 'creates an default user with indication password' do
      test_user.password = 'a' * 5
      expect(test_user).not_to be_valid
    end
  end
end
