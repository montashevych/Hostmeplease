require 'rails_helper'

describe 'the sign_in process', type: :feature do
  context 'when user can' do
    let(:test_user) { create(:user, :confirmed) }
    let(:user) { build(:user) }

    it 'create new session' do
      visit new_user_session_path
      fill_in 'Email', with: test_user.email
      fill_in 'Password', with: user.password
      click_button 'Sign In'
      have_current_path eq(root_path)
      expect(page).to have_text('Signed in successfully.')
    end

    it 'sign_up' do
      visit new_user_registration_path
      fill_in 'user[first_name]', with: user.first_name
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      fill_in 'user[password_confirmation]', with: user.password_confirmation
      click_button 'Sign Up'
      expect(page).to have_current_path(root_path, ignore_query: true)
    end
  end
end
