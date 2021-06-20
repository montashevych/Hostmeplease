require 'rails_helper'

RSpec.describe 'Showing place', type: :feature do
  let(:test_place) { FactoryBot.build(:place) }
  let(:test_address) { FactoryBot.build(:address) }

  before do
    test_place.save!
    test_address.place_id = test_place.id
    test_address.save!
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
      have_current_path eq(new_user_path)
    end

    it 'redirect to show place' do
      click_button test_place.price.to_s
      have_current_path eq(place_path(test_place))
    end
  end
end
