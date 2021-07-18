require 'rails_helper'

describe 'User', type: :feature do
  include ApplicationHelper
  let!(:test_user) { FactoryBot.build(:user) }

  context 'when flash has message' do
    before do
      visit user_session_path
      fill_in 'Email', with: test_user.email
      fill_in 'Password', with: test_user.password
    end

    it 'error message for incorrect user' do
      click_button 'Sign In'
      expect(page.text).to have_content('Invalid Email or password.')
    end

    it 'confirmation message' do
      test_user.save
      click_button 'Sign In'
      expect(page.text).to have_content('You have to confirm your email ' \
                                        'address before continuing.')
    end

    it 'successfull signed user' do
      test_user.skip_confirmation! && test_user.save
      click_button 'Sign In'
      expect(page.text).to have_content('Signed in successfully.')
      test_user.destroy
    end
  end

  context 'with the ability' do
    it 'create account' do
      visit new_user_registration_path
      fill_in 'First name', with: test_user.first_name
      fill_in 'Email', with: test_user.email
      fill_in 'Password', with: test_user.password
      fill_in 'Password confirmation', with: test_user.password_confirmation
      click_button 'Sign Up'
      have_current_path eq(root_path)
      expect(page).to have_text('A message with a confirmation link has been ' \
                                'sent to your email address. Please follow ' \
                                'the link to activate your account.')
    end

    it 'confirm email for account access' do
      test_user.save!
      usr = User.find_by email: test_user.email
      raw, enc = Devise.token_generator.generate(usr.class, :confirmation_token)
      usr.confirmation_token = enc
      usr.confirmation_sent_at = Time.now.utc
      usr.save(validate: false)
      visit "/users/confirmation?confirmation_token=#{raw}"
    end

    it 'log in to own account' do
      test_user.skip_confirmation! && test_user.save!
      visit user_session_path
      fill_in 'Email', with: test_user.email
      fill_in 'Password', with: test_user.password
      click_button 'Sign In'
      have_current_path eq(root_path)
      expect(page).to have_text('Signed in successfully.')
    end
  end

  context 'when User redirect_to Show page' do
    let(:test_user) { FactoryBot.create(:user) }

    before do
      test_registration
      test_confirmation
      test_login
    end

    it 'sees Show page' do
      visit user_path(id: test_user.id)
      expect(page).to have_current_path(user_path(id: test_user.id))
    end
  end

  context 'when User redirect_to Edit page' do
    let(:test_user) { FactoryBot.create(:user) }

    before do
      test_registration
      test_confirmation
      test_login
      visit edit_user_path(id: test_user.id)
    end

    it 'sees Edit page' do
      expect(page).to have_current_path(edit_user_path(id: test_user.id))
    end

    it 'Saves Changes successful' do
      test_edit_form
      expect(page).to have_current_path(user_path(id: test_user.id))
    end

    it 'render the Edit page' do
      visit user_path(id: test_user.id)
      click_link 'Edit Profile'
      have_current_path eq(edit_user_path(id: test_user.id))
    end
  end
end
