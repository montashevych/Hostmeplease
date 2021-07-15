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

      it 'return Show http success'do
        get user_path(id:test_user.id)
        expect(response).to redirect_to(user_path(id:test_user.id))

      end

      it 'return Edit http success'do
        get edit_user_path(id:test_user.id)
        expect(response).to redirect_to(edit_user_path)
      end

      it "creates a Widget and redirects to the Widget's page" do
       get "/users/edit"
       expect(response).to render_template(:edit)

       post "/users", params: { user_form: { first_name: 'James'} }

       expect(response).to redirect_to(assigns(:widget))
       follow_redirect!

       expect(response).to render_template(:show)
       expect(response.body).to include("Widget was successfully created.")
     end
  end

  # context 'when invalid path' do
  #   describe 'GET /users/{id}' do
  #     it 'doesnt return http success' do
  #       get '/users/foobar'
  #       expect(response).not_to have_http_status(:success)
  #     end
  #   end
  # end
end
