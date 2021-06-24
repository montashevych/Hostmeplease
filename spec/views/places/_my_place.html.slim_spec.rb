require 'rails_helper'
require 'will_paginate/array'

RSpec.describe 'places/my_places.html.slim', type: :view do
  context 'when template rendered' do
    it 'infers the controller path' do
      expect(controller.controller_path).to eq('places')
    end
  end

  context 'with render_views(false) nested in a group with render_views' do
    let(:test_user) { FactoryBot.build(:user) }
    let(:test_place) { FactoryBot.create(:place, user: test_user) }

    it 'renders the RSpec generated template' do
      expect(response.body).to eq('')
    end
  end

  context 'when was successfull status' do
    let(:user) { FactoryBot.create(:user, :confirmed) }
    let(:test_place) { FactoryBot.create(:place, user: user) }

    before do
      allow(view).to receive(:user_signed_in?).and_return(true)
    end

    it 'render partial' do
      @places = [test_place].paginate
      sign_in user
      render
      expect(rendered).to match(/Workspace/)
    end
  end
end
