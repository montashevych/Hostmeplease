require 'rails_helper'

RSpec.describe 'users/show.html.slim', type: :view do
  context 'when template rendered' do
    it 'infers the controller path' do
      expect(controller.controller_path).to eq('users')
    end

    it 'infers the controller action' do
      expect(controller.request.path_parameters[:action]).to eq('show')
    end
  end
end
