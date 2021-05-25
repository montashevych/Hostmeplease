require 'rails_helper'

RSpec.describe "Places", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/places/index"
      expect(response).to have_http_status(:success)
    end
  end

end
