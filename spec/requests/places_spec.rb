require 'rails_helper'

RSpec.describe "Places", type: :request do
  before(:all) do
    get "/places"
  end

  describe "GET /index" do
    context "with successfull status" do
      it "returns http success" do
        expect(response).to have_http_status(:success)
      end
    end

    context 'template was created and does not removed' do
      it "template was found" do
        expect(response).not_to have_http_status(:not_found)
      end
    end
  end
end
