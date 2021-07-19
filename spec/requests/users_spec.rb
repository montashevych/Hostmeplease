require 'rails_helper'

RSpec.describe 'Users', type: :request do
  context 'when valid path' do
    let(:test_user) { build(:user) }

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
        expect(response).to redirect_to('/users/sign_in')
      end
    end
  end

  context 'when invalid path' do
    it 'doesnt return http success' do
      get '/users/foobar'
      expect(response).not_to have_http_status(:success)
    end
  end

  context 'when User' do
    let(:user) { create(:user, :confirmed) }

    before do
      sign_in user
    end

    it 'return Show render partial' do
      get user_path(user)
      expect(response).to render_template('users/_user_form')
    end

    it 'return Show http success' do
      get user_path(user)
      expect(response).to have_http_status(:success)
    end

    it 'return Edit render partial' do
      get edit_user_path(user)
      expect(response).to render_template('users/_user_form')
    end

    it 'return Edit http success' do
      get edit_user_path(user)
      expect(response).to have_http_status(:success)
    end

    # rubocop:disable RSpec/ExampleLength
    # rubocop:disable RSpec/MultipleExpectations
    it "creates a User and redirects to User's page" do
      patch user_path(user), params: { user_form: { first_name: 'James', last_name: 'Bond',
                                                    email: 'james@gmail.com', phone_number: '+380963451234' } }

      expect(response).to be_redirect
      follow_redirect!
      expect(response).to render_template('users/_user_form')
      expect(response.body).to include('User was successfully updated.')
    end
    # rubocop:enable RSpec/ExampleLength
    # rubocop:enable RSpec/MultipleExpectations
  end
end
