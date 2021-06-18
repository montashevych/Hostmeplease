require 'rails_helper'

RSpec.describe PlacesController do
  describe PlacesController do
    context 'when User' do
      let(:test_user) { FactoryBot.build(:user) }

      before do
        test_user.skip_confirmation!
        test_user.save!
      end

      it 'is valid with valid attributes' do
        expect(test_user).to be_valid
      end
    end

    it 'render template index' do
      get :index
      expect(response).to render_template 'places/index'
    end

    context 'when User login User' do
      let(:test_user) { FactoryBot.build(:user) }
      let(:test_place) { FactoryBot.build(:place) }

      before do
        test_user.skip_confirmation!
        test_user.save!
        test_place.user_id = test_user.id
        test_place.save
      end

      it 'count current_user places' do
        sign_in test_user

        get :my_places
        expect(assigns(:count_places)).to eq(1)
      end

      it 'render template my_places' do
        sign_in test_user

        get :my_places
        expect(response).to render_template 'my_places'
      end
    end
  end
end
