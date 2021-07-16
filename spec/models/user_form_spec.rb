require 'rails_helper'

RSpec.describe UserForm do
  context 'when not valid' do
    let(:form) { UserForm.new(user: user, **parameters) }
    let(:parameters_first_name) { { first_name: 'a' } }
    let(:parameters_long_first_name) { { first_name: 'a' * 51 } }
    let(:parameters_last_name) { { last_name: 'a' } }
    let(:parameters_long_last_name) { { last_name: 'a' * 51 } }

    it 'creates an default user with indication first_name' do
      form.parameters_first_name
      expect(form).not_to be_valid
    end

    it 'creates an default user with indication last_name' do
      form.parameters_last_name
      expect(form).not_to be_valid
    end

    it 'creates an default user with long last_name' do
      form.parameters_long_first_name
      expect(form).not_to be_valid
    end

    it 'creates an user with long last_name' do
      form.parameters_long_last_name
      expect(form).not_to be_valid
    end
  end

  context 'when not valid phone_number' do
    let(:form) { UserForm.new(user: user, **parameters) }
    let(:parameters_email) { { email: ' ' } }
    let(:parameters_phone_number) { { phone_number: '1' * 7 } }
    let(:parameters_long_phone_number) { { phone_number: '1' * 18 } }

    it 'creates an user email' do
      form.parameters_email
      expect(form).not_to be_valid
    end

    it 'creates an  user with short phone_number' do
      form.parameters_phone_number
      expect(form).not_to be_valid
    end

    it 'creates an user with long phone_number' do
      form.parameters_long_phone_number
      expect(form).not_to be_valid
    end
  end
end
