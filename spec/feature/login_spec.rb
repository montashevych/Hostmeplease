require 'rails_helper'

describe 'the sign_in process', type: :feature do
  include ApplicationHelper
  context 'when user can' do
    let(:test_user) { FactoryBot.create(:user, :confirmed) }

    before do
      test_registration
      test_confirmation
      test_login
    end

    it 'create new session' do
      have_current_path eq(root_path)
      expect(page).to have_text('Signed in successfully.')
    end

    # it 'sign_up' do
    #   visit '/users/sign_up'
    #   fill_in 'user[first_name]', with: test_user.first_name
    #   fill_in 'user[email]', with: test_user.email
    #   fill_in 'user[password]', with: test_user.password
    #   fill_in 'user[password_confirmation]', with: test_user.password_confirmation
    #   click_button 'Sign Up'
    #   expect(current_path).to eq(root_path)
    # end
  end
end
