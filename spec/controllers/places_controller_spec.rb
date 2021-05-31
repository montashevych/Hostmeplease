require 'rails_helper'

RSpec.describe PlacesController do
  describe 'GET index' do
    it 'renders the index template' do
      get 'index'
      expect(response).to render_template(:index)
    end

    it 'return HTML' do
      get 'index'
      expect(response.media_type).to eq 'text/html'
    end
  end
end
