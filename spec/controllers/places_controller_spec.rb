require 'rails_helper'

RSpec.describe PlacesController do
  let(:test_user) { FactoryBot.create(:user, :confirmed) }
  let!(:test_address) { FactoryBot.build(:address) }
  let!(:test_picture) { FactoryBot.build(:picture) }
  let(:test_place) {
    FactoryBot.create(:place, user: test_user,
                              address: test_address,
                              pictures: [test_picture])
  }
  let(:file) {
    Rack::Test::UploadedFile.new(
                      File.open(Rails.root.join('spec/factories/test.png')),
                      'image/png',
                    )
  }

  context 'when User' do
    it 'with valid attributes' do
      expect(test_user).to be_valid
    end
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
      parameters = test_place.attributes
      parameters.store(:address_attributes, test_address.attributes)
      parameters.store(:pictures_attributes, [image: file])
      post :create, params: { place: parameters }
      expect(response).to redirect_to(place_path(Place.last))
    end

    it 'my_places' do
      get :my_places
      expect(response).to render_template 'my_places'
    end
  end

  context 'when User is login and' do
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
      post :create, params: { place: test_place.attributes,
                              address_attributes: test_address.attributes,
                              pictures_attributes: test_picture.attributes }
      expect(response.content_type) == 'text/html'
    end
  end
end
