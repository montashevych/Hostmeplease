require 'rails_helper'

RSpec.describe 'shared/_my_place.html.slim', type: :view do
  context 'when template rendered' do
    it 'infers the controller path' do
      expect(controller.controller_path).to eq('shared')
    end
  end
end

RSpec.describe PlacesController, 'shared/my_place.html.slim', type: :controller do
  context "with render_views(false) nested in a group with render_views" do
    let!(:test_user) { FactoryBot.build(:user) }
    let!(:test_place) { FactoryBot.create(:place, user: test_user) }

    it "renders the RSpec generated template" do
      expect(response.body).to eq("")
    end
  end
end
