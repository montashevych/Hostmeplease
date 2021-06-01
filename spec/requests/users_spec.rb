require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /sign_up' do
    it 'returns http success' do
      get '/users/sign_up'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /sight_in' do
    it 'returns http success' do
      get '/users/sign_in'
      expect(response).to have_http_status(:success)
    end
  end
end
