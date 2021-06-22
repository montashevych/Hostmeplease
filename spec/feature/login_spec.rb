require 'rails_helper'

describe 'the sign_in process', type: :feature do
  context 'when user can' do
    let!(:test_user) { FactoryBot.build(:user) }

    before do
      visit new_user_registration_path
      fill_in 'First name', with: test_user.first_name
      fill_in 'Email', with: test_user.email
      fill_in 'Password', with: test_user.password
      fill_in 'Password confirmation', with: test_user.password_confirmation
      click_button "Sign Up"
      visit "/"
      usr = User.find_by_email test_user.email
      raw, enc = Devise.token_generator.generate(usr.class, :confirmation_token)
      usr.confirmation_token = enc
      usr.confirmation_sent_at = Time.now.utc
      usr.save(validate: false)
      visit "/users/confirmation?confirmation_token=#{raw}"
      visit user_session_path
      fill_in 'Email', with: test_user.email
      fill_in 'Password', with: test_user.password
      click_button 'Sign In'
    end

    it 'create new session' do
      have_current_path eq(root_path)
      expect(page).to have_text('Signed in successfully.')
    end

    # it 'sign_up' do
    #   visit '/users/sign_up'
    #   fill_in 'First name', with: test_user.first_name
    #   fill_in 'Email', with: Faker::Internet.unique.email
    #   fill_in 'Password', with: test_user.password
    #   fill_in 'Password confirmation', with: test_user.password
    #   click_button 'Sign Up'
    #   expect(current_path).to eq(root_path)
    # end
  end
end
