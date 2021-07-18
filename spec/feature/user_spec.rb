require 'rails_helper'

RSpec.describe 'User Profile', type: :feature do
  include ApplicationHelper
  let(:test_user) { FactoryBot.create(:user) }

  context 'when User redirect_to Show page' do
    before do
      test_registration
      test_confirmation
      test_login
    end

    it 'sees Show page' do
      visit user_path(id: test_user.id)
      expect(page).to have_current_path(user_path(id: test_user.id))
    end

    it 'render the Avatar image' do
      visit user_path(id: test_user.id)
      click_link 'Change Photo'
      expect(page).to have_text('Change Photo')
    end
  end

  context 'when User redirect_to Edit page' do
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
