require 'rails_helper'

RSpec.describe 'Showing place', type: :feature do
  include ApplicationHelper

  let(:test_user) { FactoryBot.build(:user) }
  let(:test_place) { FactoryBot.create :place, user: test_user }
  let(:test_address) { FactoryBot.build(:address) }
  let(:test_picture) { FactoryBot.build(:picture) }

  before do
    test_address.place_id = test_place.id
    test_picture.imageable_id = test_place.id
    test_address.save!
    test_picture.save!
    visit places_path
  end

  describe('list of places') do
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

      it 'redirect to show place' do
        click_button test_place.price.to_s
        have_current_path eq(place_path(:place))
      end
    end
  end

  describe('my places') do
    let(:test_user) { FactoryBot.build(:user) }
    let!(:test_place) { FactoryBot.create :place, user: test_user }

    before do
      test_registration
      test_confirmation
      test_login
      visit my_places_path
    end

    it 'sign_in page' do
      click_on 'Sign In'
      have_current_path eq(new_user_session_path)
    end

    it 'sign_up page' do
      click_on 'Sign Up'
      have_current_path eq(new_user_path)
    end

    it 'redirect to show place' do
      click_button test_place.price.to_s
      have_current_path eq(place_path(test_place))
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
end
