require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:test_user) { FactoryBot.create(:user) }

  context 'when valid path' do
    # describe 'GET /sign_up' do
    #   it 'returns http success' do
    #     get '/users/sign_up'
    #     expect(response).to have_http_status(:success)
    #   end
    # end
    #
    # describe 'GET /sight_in' do
    #   it 'returns http success' do
    #     get '/users/sign_in'
    #     expect(response).to have_http_status(:success)
    #   end
    # end
    #
    # describe 'GET /users/{id}' do
    #   it 'redirects to sign in' do
    #     get "/users/#{test_user.id}"
    #     expect(response).to redirect_to('/users/sign_in')
    #   end
    # end
      before do
        test_user.confirm
        get '/users/sign_in'
        post '/users/sign_in', params: { test_user: { email: 'james@gmail.com', password: '123456',
    password_confirmation: '123456' } }
        expect(response).to render_template(root_path)
      end

      it 'return Show http success' do
        get user_path(id: test_user.id)
        expect(response).to redirect_to(user_path(id: test_user.id))
        expect(response).to have_http_status(:success)
      end

      it 'return Edit http success' do
        get edit_user_path(id: test_user.id)
        expect(response).to redirect_to(edit_user_path(id: test_user.id))
        expect(response).to have_http_status(:success)
      end

      it "creates a User and redirects to User's page" do
        get '/users/show'
        expect(response).to redirect_to(user_path(id: test_user.id))

        post '/users', params: { user_form: { first_name: 'James', last_name: 'Bond', email: 'james@gmail.com',
                                phone_number: '+380963451234' } }

        expect(response).to redirect_to(assigns(:user_form))
        follow_redirect!

        expect(response).to redirect_to(user_path(id: test_user.id))
        expect(response.body).to include('User was successfully updated.')
      end
    end

    # context 'when invalid path' do
    #   it 'doesnt return http success' do
    #     get '/users/foobar'
    #     expect(response).not_to have_http_status(:success)
    #   end
    # end
  end
