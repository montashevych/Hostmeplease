require 'rails_helper'

RSpec.describe PlacesController do
  describe PlacesController do
    it 'test rendering template' do
      get :index
      expect(response).to render_template 'places/index'
    end
  end
end
