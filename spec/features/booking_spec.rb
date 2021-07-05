require 'rails_helper'

RSpec.feature "Bookings", type: :feature do
  let!(:test_user) { FactoryBot.create(:user, :confirmed) }
  let!(:place_owner) { create :user, confirmed_at: DateTime.now }
  let!(:test_place) { create :place, user: place_owner }

  context 'when user is not logged in' do
    it 'does not let them to book a place' do
      visit place_path(test_place)
      expect(page).not_to have_selector('form')
    end
  end

  context 'when user is logged in' do
    before do
      visit user_session_path
      fill_in 'Email', with: test_user.email
      fill_in 'Password', with: test_user.password
      click_button 'Sign In'
    end

    context 'on place page' do
      before(:each) do
        visit place_path(test_place)
      end

      it 'shows a form for booking' do
        expect(page).to have_selector('form')
      end

      it 'redirects after success' do
        find(:id, 'booking_checkin', visible: false).set(DateTime.now.strftime('%Y-%m-%d'))              # set checkin date in a hidden field
        find(:id, 'booking_checkout', visible: false).set((DateTime.now + 10.days).strftime('%Y-%m-%d')) # set checkout date
        click_button 'Quick book'
        expect(page).to have_title("Confirm Booking")
      end
    end

    context 'on booking confirmation page' do
      let(:test_booking) { create :booking, user: test_user, place: test_place, checkin: DateTime.now + 1.months, checkout: DateTime.now + 2.months }

      before(:each) do
        visit booking_confirm_path(test_booking)
      end

      it 'shows checkin and checkout dates' do
        expect(page).to have_content(test_booking.checkin.strftime("%Y-%m-%d"))
        expect(page).to have_content(test_booking.checkout.strftime("%Y-%m-%d"))
      end

      it 'shows price per night and total price' do
        expect(page).to have_content(test_booking.place.price.to_s)
        expect(page).to have_content(test_booking.full_price.to_s)
      end

      it 'shows place name and location on map' do
        expect(page).to have_content(test_booking.place.title)
        expect(page).to have_selector('#map')
      end

      it 'has a button to print the receipt' do
        expect(page).to have_link('Print Receipt')
      end

      it 'has a button to confirm the booking' do
        expect(page).to have_link('Confirm')
      end
    end

    context 'in header' do
      before do
        visit root_path
      end

      it 'shows link for My Bookings page' do
        expect(page).to have_link('My Bookings', visible: false) # not visible by default
      end
    end

    context 'on My Bookings page' do
      let(:test_booking) { create :booking, user: test_user, place: test_place, checkin: DateTime.now + 6.months, checkout: DateTime.now + 7.months }

      before(:each) do
        visit user_bookings_path(test_user)
      end

      it 'shows bookings' do
        expect(page).to have_content(test_booking.place.title) # check has title
        expect(page).to have_content(test_booking.checkin.to_s) # checkin date
        expect(page).to have_content(test_booking.checkout.to_s) # checkout date
      end

      it "has a link to booking's page" do
        expect(page).to have_link(href: booking_path(test_booking))
      end
    end
  end
end
