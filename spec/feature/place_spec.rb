require 'rails_helper'

RSpec.describe 'Showing', type: :feature do
  include ApplicationHelper

  let!(:test_user) { FactoryBot.create(:user, :confirmed) }
  let!(:test_address) { FactoryBot.create(:address) }
  let!(:test_place) {
    FactoryBot.create :place,
                      user: test_user,
                      address: test_address
  }
  let!(:test_picture) { FactoryBot.create(:picture, imageable: test_place) }

  after do
    test_picture.destroy
  end

  describe('list of places') do
    before do
      visit places_path
    end

    context 'when it have content' do
      it 'returns headers\'s title' do
        expect(page).to have_content('Find top coworking')
      end

      it 'returns header\'s subtitle' do
        expect(page).to have_content('spaces near you')
      end
    end

    context 'with redirects to' do
      it 'home page' do
        click_on 'HostMePlease'
        have_current_path eq(root_path)
      end

      it 'sign_in page' do
        click_on 'Sign In'
        have_current_path eq(new_user_session_path)
      end

      it 'sign_up page' do
        click_on 'Sign Up'
        have_current_path eq(new_user_registration_path)
      end

      it 'show place' do
        click_button test_place.price.to_s
        have_current_path eq(place_path(:place))
      end
    end
  end

  describe('my places') do
    before do
      test_registration
      test_confirmation
      test_login
      visit my_places_path
    end

    context 'when it have content' do
      it 'returns headers\'s title' do
        expect(page).to have_content("Your Places(#{test_user.places.count})")
      end
    end

    context 'with redirects to' do
      it 'home page' do
        click_on 'HostMePlease'
        have_current_path eq(root_path)
      end

      it 'redirect to Edit Place' do
        click_on 'Edit Place'
        have_current_path eq(edit_place_path(test_place))
      end

      it 'redirect to New Place' do
        click_on 'New Place'
        have_current_path eq(new_place_path)
      end
    end
  end

  describe('new place page') do
  end
end
