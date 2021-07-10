require 'rails_helper'

RSpec.describe 'Showing', type: :feature do
  let!(:test_user) { FactoryBot.create(:user, :confirmed) }
  let!(:test_address) { FactoryBot.build(:address) }
  let(:test_picture) { FactoryBot.build(:picture) }
  let!(:test_place) {
    FactoryBot.create :place,
                      user: test_user,
                      address: test_address,
                      pictures: [test_picture]
  }

  after do
    test_picture.destroy
    test_place.destroy
  end

  describe('list of places') do
    before do
      visit places_path
    end

    context 'when it has' do
      it 'headers\'s title' do
        expect(page).to have_content('Find top coworking')
      end

      it 'header\'s subtitle' do
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
      visit user_session_path
      fill_in 'Email', with: test_user.email
      fill_in 'Password', with: test_user.password
      click_button 'Sign In'
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
    before do
      visit user_session_path
      fill_in 'Email', with: test_user.email
      fill_in 'Password', with: test_user.password
      click_button 'Sign In'
    end

    context 'when flash has message' do
      it 'successfully created place message' do
        visit new_place_path
        fill_in 'place_title', with: 'q' * 9
        fill_in 'place_description', with: 'q' * 30
        fill_in 'place_price', with: 100
        fill_in 'place_address_attributes_state_region', with: Faker::Address.state
        fill_in 'place_address_attributes_city', with: Faker::Address.city
        fill_in 'place_address_attributes_details', with: "#{Faker::Address.street_name}, 1"
        page.attach_file('place[pictures_attributes][][image]', Rails.root.join('spec/factories/test.png'), visible: false)
        click_button 'Save'
        expect(page.text).to have_content('Place created')
      end

      it 'error message for incorrect place' do
        visit new_place_path
        fill_in 'place_title', with: 'q'
        fill_in 'place_description', with: 'q' * 30
        fill_in 'place_price', with: 100
        fill_in 'place_address_attributes_state_region', with: Faker::Address.state
        fill_in 'place_address_attributes_city', with: Faker::Address.city
        fill_in 'place_address_attributes_details', with: "#{Faker::Address.street_name}, 1"
        page.attach_file('place[pictures_attributes][][image]', Rails.root.join('spec/factories/test.png'), visible: false)
        click_button 'Save'
        expect(page.text).to have_content('Incorrect data entry')
      end
    end

    context 'when it has' do
      it 'headers\'s title' do
        visit new_place_path
        expect(page).to have_content('New Place')
      end
    end

    context 'when form has' do
      before do
        visit new_place_path
      end

      it 'title label' do
        expect(page).to have_content('Title')
      end

      it 'type label' do
        expect(page).to have_content('Type')
      end

      it 'type has options' do
        expect(page).to have_content('Accommodation Workspace')
      end

      it 'description label' do
        expect(page).to have_content('Description')
      end

      it 'price label' do
        expect(page).to have_content('Price')
      end

      it 'country label' do
        expect(page).to have_content('Country')
      end

      it 'state or region label' do
        expect(page).to have_content('State / region')
      end

      it 'city label' do
        expect(page).to have_content('City')
      end

      it 'address label' do
        expect(page).to have_content('Address')
      end

      it 'pictures label' do
        expect(page).to have_content('+')
      end
    end

    context 'when it' do
      it 'successfull create new place' do
        visit new_place_path
        fill_in 'place_title', with: 'q' * 9
        fill_in 'place_description', with: 'q' * 30
        fill_in 'place_price', with: 100
        fill_in 'place_address_attributes_state_region', with: Faker::Address.state
        fill_in 'place_address_attributes_city', with: Faker::Address.city
        fill_in 'place_address_attributes_details', with: "#{Faker::Address.street_name}, 1"
        page.attach_file('place[pictures_attributes][][image]', Rails.root.join('spec/factories/test.png'), visible: false)
        click_button 'Save'
        have_current_path eq(my_places_path)
      end
    end
  end
end
