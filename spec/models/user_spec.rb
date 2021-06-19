require 'rails_helper'

RSpec.describe User do
  context 'when valid' do
    let(:user_with_name_of_two_length) { build(:user, first_name: 'a' * 2) }
    let(:user_with_password_of_sixth_length) { build(:user, password: 'a' * 6) }
    let(:user_without_name_role) { build(:user, role: 'owner') }
    let(:user_from_google) { User.from_google(email: 'test@mail.com', params: { password: 'a'*6, first_name:'a'*2 }) }

    it 'creates an default user with indication name' do
      expect(user_with_name_of_two_length).to be_valid
    end

    it 'creates an default user with indication password' do
      expect(user_with_password_of_sixth_length).to be_valid
    end

    it 'creates an user with owner role' do
      expect(user_without_name_role).to be_valid
    end

    it 'creates a user from google' do
      expect(user_from_google).to be_valid
    end
  end

  context 'when not valid' do
    let(:user_with_empty_name) { build(:user, first_name: '    ') }
    let(:user_with_long_name) { build(:user, first_name: '1' * 51) }
    let(:user_without_email) { build(:user, email: '') }
    let(:user_without_password) { build(:user, password: '') }
    let(:user_without_role) { build(:user, role: '') }
    let(:user_from_google_without_params) { User.from_google(email: 'test@mail.com', params: {}) }
    let(:user_from_google_without_name) { User.from_google(email: 'test@mail.com', params: { password: 'a'*6 }) }
    let(:user_from_google_without_password) { User.from_google(email: 'test@mail.com', params: { first_name: 'a'*2 }) }

    it 'creates an user with space-name' do
      expect(user_with_empty_name).not_to be_valid
    end

    it 'creates an user with long name' do
      expect(user_with_long_name).not_to be_valid
    end

    it 'creates an user without email' do
      expect(user_without_email).not_to be_valid
    end

    it 'creates an user without password' do
      expect(user_without_password).not_to be_valid
    end

    it 'creates an user without role' do
      expect(user_without_role).not_to be_valid
    end

    it 'creates an user without params' do
      expect(user_from_google_without_params).not_to be_valid
    end

    it 'creates a user without name' do
      expect(user_from_google_without_name).not_to be_valid
    end

    it 'creates a user without password' do
      expect(user_from_google_without_password).not_to be_valid
    end
  end

  context 'when not valid password' do
    let(:user_with_long_password) { build(:user, password: '1' * 256) }

    it 'creates an user with long password' do
      expect(user_with_long_password).not_to be_valid
    end
  end
end
