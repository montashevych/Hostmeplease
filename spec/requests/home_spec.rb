require 'rails_helper'

RSpec.describe "Home", type: :request do
  describe "GET /" do
    it "works!" do
      get root_path
      expect(response).to have_http_status(200)
      expect(response).to render_template("home/index")
    end
  end
end
