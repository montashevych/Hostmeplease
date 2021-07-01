require 'rails_helper'

RSpec.describe PlacesController do
  describe PlacesController do
    context 'when User' do
      let(:test_user) { FactoryBot.create(:user, :confirmed) }

      it 'is valid with valid attributes' do
        expect(test_user).to be_valid
      end
    end

    it 'render template index' do
      get :index
      expect(response).to render_template 'places/index'
    end

    context 'when User is login and User see ' do
      let(:test_user) { FactoryBot.create(:user, :confirmed) }
      let!(:user_places) { [FactoryBot.create(:place, user: test_user)] }

      it 'count current_user places' do
        sign_in test_user

        get :my_places
        expect(assigns(:count_places)).to eq(user_places.count)
      end

      it 'render template my_places' do
        sign_in test_user

        get :my_places
        expect(response).to render_template 'my_places'
      end
    end
  end
end
