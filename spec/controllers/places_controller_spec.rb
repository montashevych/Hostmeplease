require 'rails_helper'

RSpec.describe PlacesController do
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

  context 'when rendered template after action' do
    before do
      sign_in test_user
    end

    it 'index' do
      get :index
      expect(response).to render_template 'index'
    end

    it 'show' do
      get :show, params: { id: test_place.id }
      expect(response).to render_template 'show'
    end

    it 'new' do
      get :new
      expect(response).to render_template 'new'
    end

    it 'create' do
      post :create, params: { place: parameters }
      expect(response).to redirect_to(place_path(Place.last))
    end

    it 'my_places' do
      get :my_places
      expect(response).to render_template 'my_places'
    end
  end

  context 'when User is loged in can' do
    before do
      sign_in test_user
    end

    it 'see own places count' do
      get :my_places
      expect(assigns(:count_places)).to eq(test_user.places.count)
    end
  end

  context 'with created place' do
    it 'have page type' do
      post :create, params: { place: parameters }
      expect(response.content_type).to include('text/html')
    end
  end
end
