require 'rails_helper'

RSpec.describe PlacesController do
  describe PlacesController do
    let(:test_user) { FactoryBot.create(:user, :confirmed) }

    context 'when User' do
      it 'with valid attributes' do
        expect(test_user).to be_valid
      end
    end

    context 'when rendered template' do
      before do
        sign_in test_user
      end

      it 'index' do
        get :index
        expect(response).to render_template 'places/index'
      end

      it 'new' do
        get :new
        expect(response).to render_template 'places/new'
      end

      it 'see rendered template my_places' do
        get :my_places
        expect(response).to render_template 'my_places'
      end
    end

    context 'when User is login and' do
      let!(:user_places) { [FactoryBot.create(:place, user: test_user)] }

      before do
        sign_in test_user
        get :my_places
      end

      it 'see own places count' do
        expect(assigns(:count_places)).to eq(user_places.count)
      end
    end
  end
end
