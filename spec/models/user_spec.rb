require 'rails_helper'

RSpec.describe User do
  context 'when valid' do
    let(:test_user) { FactoryBot.build(:user, role: 'owner') }
    let(:user_from_google) {
      described_class.from_google(email: 'test_one@gmail.com', params: {  password: 'a' * 6,
                                                                          first_name: 'a' * 2,
                                                                          last_name: 'a' * 2,
                                                                          phone_number: '1' * 8 })
    }

    it 'creates an user with owner role' do
      expect(test_user).to be_valid
    end

    it 'creates a user from google' do
      expect(user_from_google).to be_valid
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

    it 'creates an default user with indication last_name' do
      test_user.last_name = 'a'
      expect(test_user).not_to be_valid
    end

    it 'creates an user with long last_name' do
      test_user.last_name = 'a' * 51
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

    it 'creates an user without params' do
      expect {
        described_class.from_google(email: 'test@mail.com', params: {})
      }.to raise_error(ArgumentError) # with empty params create_with(**params) takes 0, it is supposed to take >= 1
    end

    it 'creates a user without name' do
      expect {
        described_class.from_google(email: 'test@mail.com', params: { password: 'a' * 6 })
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'creates a user without password' do
      expect {
        described_class.from_google(email: 'test@mail.com', params: { first_name: 'a' * 2 })
      }.to raise_error(ActiveRecord::RecordInvalid)
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

  context 'when not valid phone_number' do
    let(:test_user) { FactoryBot.build(:user) }

    it 'creates an  user with short phone_number' do
      test_user.phone_number = '1' * 7
      expect(test_user).not_to be_valid
    end

    it 'creates an user with long phone_number' do
      test_user.phone_number = '1' * 18
      expect(test_user).not_to be_valid
    end
  end
end
