require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:test_user) { build :user }

  context 'when valid path' do

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

    describe 'GET /users/{id}' do
      it 'redirects to sign in' do
        get "/users/#{test_user.id}"
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to('/users/sign_in')
      end
    end
  end

  context 'when invalid path' do
    describe 'GET /users/{id}' do
      it 'doesnt return http success' do
        get "/users/foobar"
        expect(response).not_to have_http_status(:success)
      end
    end
  end
end
