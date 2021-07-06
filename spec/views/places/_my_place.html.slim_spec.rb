require 'rails_helper'
require 'will_paginate/array'

RSpec.describe 'places/my_places.html.slim', type: :view do
  let!(:test_user) { FactoryBot.create(:user, :confirmed) }
  let!(:test_address) { FactoryBot.create(:address) }
  let!(:test_place) {
    FactoryBot.create :place,
                      user: test_user,
                      address: test_address
  }
  let!(:test_picture) { FactoryBot.create(:picture, imageable: test_place) }

  after do
    test_picture.destroy
    test_place.destroy
  end

  context 'when template rendered' do
    it 'infers the controller path' do
      expect(controller.controller_path).to eq('places')
    end
  end

  context 'with render_views(false) nested in a group with render_views' do
    it 'renders the RSpec generated template' do
      expect(response.body).to eq('')
    end
  end

  context 'when was successfull status' do
    before do
      allow(view).to receive(:user_signed_in?).and_return(true)
    end

    it 'render my_places template' do
      @places = [test_place].paginate
      sign_in test_user
      render
      expect(rendered).to match(/Workspace/)
    end
  end
end
