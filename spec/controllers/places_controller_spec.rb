require 'rails_helper'

RSpec.describe PlacesController do
  describe PlacesController do

    it 'render template index and partials' do
      get :index
      expect(response).to render_template 'places/index'
    end
  end
end
