require 'rails_helper'

RSpec.describe 'Showing', type: :feature do
  describe('list of places') do
    let(:test_user) { FactoryBot.build(:user) }
    let(:test_place) { FactoryBot.build(:place) }

    before do
      test_user.skip_confirmation!
      test_user.save!
      test_place.user_id = test_user.id
      test_place.save!
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

      it 'redirect to show place' do
        click_button test_place.price.to_s
        have_current_path eq(place_path(:place))
      end
    end
  end

  describe('my places') do
    let(:test_user) { FactoryBot.build(:user) }
    let!(:test_place) { FactoryBot.build(:place) }

    before do
      test_user.skip_confirmation!
      test_user.save
      visit new_user_session_path
      fill_in 'Email', with: test_user.email
      fill_in 'Password', with: test_user.password
      click_button 'Sign In'
      test_place.user_id = test_user.id
      test_place.save
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

      it 'redirect to edit place' do
        click_on 'Edit'
        have_current_path eq(edit_place_path(test_place))
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
