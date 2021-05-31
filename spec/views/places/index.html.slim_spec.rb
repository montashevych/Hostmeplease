require 'rails_helper'

RSpec.describe "places/index.html.slim", type: :view do
  context 'render template' do
    it "infers the controller path" do
      expect(controller.request.path_parameters[:controller]).to eq("places")
      expect(controller.controller_path).to eq("places")
    end

    it "infers the controller action" do
      expect(controller.request.path_parameters[:action]).to eq("index")
    end
  end
end
