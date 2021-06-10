require 'rails_helper'

describe 'the sign_in process', type: :feature do
  context 'when user can' do
    let(:test_user) { FactoryBot.build(:user) }

    it 'sign in' do
      test_user.skip_confirmation!
      test_user.save!
      visit '/users/sign_in'
      fill_in 'Email', with: test_user.email
      fill_in 'Password', with: test_user.password
      click_button 'Sign In'
      expect(current_path).to eq(root_path)
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
