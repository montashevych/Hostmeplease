require 'rails_helper'

describe PlacesController do
  it 'test rendering template' do
    get :index
    expect(response).to render_template 'places/index'
  end
end
