require 'rails_helper'

RSpec.describe 'Places', type: :request do
  let(:test_user) { FactoryBot.create(:user, :confirmed) }
  let!(:test_address) { FactoryBot.build(:address) }
  let!(:test_picture) { FactoryBot.build(:picture) }
  let(:test_place) do
    FactoryBot.create(:place, user: test_user,
                              address: test_address,
                              pictures: [test_picture])
  end
  let(:parameters) do
    FactoryBot.attributes_for(:place, :with_address, :with_picture)
  end

  context 'when the user is not logged in visiting the' do
    it '\'index\' page returns http success' do
      get places_path
      expect(response).to have_http_status(:success)
    end

    it '\'show\' page returns http success' do
      get place_path(test_place)
      expect(response).to have_http_status(:success)
    end

    it '\'new\' page returns http unauthorized' do
      get new_place_path
      expect(response).to redirect_to(new_user_session_path)
    end

    it '\'create\' page returns http unauthorized' do
      post places_path, params: { place: parameters }
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
