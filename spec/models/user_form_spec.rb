require 'rails_helper'

RSpec.describe UserForm do
  context 'when not valid' do
    let!(:user) { FactoryBot.create(:user) }
    let(:form) { ->(parameters) { described_class.new(user: user, **parameters) } }

    it 'creates an default user with indication first_name' do
      parameters = { first_name: 'a' }
      expect(form.call(parameters)).not_to be_valid
    end

    it 'creates an default user with long fist_name' do
      parameters = { first_name: 'a' * 51 }
      expect(form.call(parameters)).not_to be_valid
    end

    it 'creates an default user with indication last_name' do
      parameters = { last_name: 'a' }
      expect(form.call(parameters)).not_to be_valid
    end

    it 'creates an user with long last_name' do
      parameters = { last_name: 'a' * 51 }
      expect(form.call(parameters)).not_to be_valid
    end
  end

  context 'when not valid parameters' do
    let(:user) { FactoryBot.create(:user) }
    let(:form) { ->(parameters) { described_class.new(user: user, **parameters) } }

    it 'creates an user email' do
      parameters = { email: ' ' }
      expect(form.call(parameters)).not_to be_valid
    end

    it 'creates an  user with short phone_number' do
      parameters = { phone_number: 'a' * 7 }
      expect(form.call(parameters)).not_to be_valid
    end

    it 'creates an user with long phone_number' do
      parameters = { phone_number: 'a' * 18 }
      expect(form.call(parameters)).not_to be_valid
    end
  end
end
