require 'rails_helper'

RSpec.describe 'places/my_places.html.slim', type: :view do
  context 'when template rendered' do

    it 'infers the controller path' do
      expect(controller.controller_path).to eq('places')
    end

    it 'infers the controller action' do
      expect(controller.request.path_parameters[:action]).to eq('my_places')
    end
  end
end
