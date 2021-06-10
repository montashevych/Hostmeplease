require 'rails_helper'

RSpec.describe 'Creating a place', type: :feature do
  let(:test_place) { FactoryBot.build(:place) }

  context 'have content' do
    it 'has header title' do
      visit places_path
      expect(page).to have_content('Find top coworking')
      expect(page).to have_content('spaces near you')
    end
  end

  context 'redirect to' do
    it 'home page' do
      visit places_path
      click_on 'HostMePlease'
      expect(current_path).to eq(root_path)
    end

    it 'sign_in page' do
      visit places_path
      click_on 'Sign In'
      expect(current_path).to eq('/users/sign_in')
    end

    it 'sign_in page' do
      visit places_path
      click_on 'Sign Up'
      expect(current_path).to eq('/users/sign_up')
    end

    it 'redirect to show place' do
      place = Place.create(title: 'dcds', description: 'fsdveve', price: '121',
                           status: :created, is_active: true)
      visit places_path
      click_button "#{place.price}"
    end
  end
end
