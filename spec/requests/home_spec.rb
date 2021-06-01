require 'rails_helper'

RSpec.describe 'Home', type: :request do
  describe 'GET /' do
    it 'responds with 200' do
      get root_path
      expect(response).to have_http_status(:ok)
    end

    it 'renders homepage template' do
      get root_path
      expect(response).to render_template('home/index')
    end
  end
end
