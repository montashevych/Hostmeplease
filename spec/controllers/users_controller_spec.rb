require 'rails_helper'

RSpec.describe UsersController do
  describe 'profile page' do
    let(:test_user) { build(:user, password: 'asdasd', password_confirmation: 'asdasd') }

    context 'when not signed in' do
      it 'redirects to /sign_in' do
        get :show, params: { id: test_user.id }
        expect(response).to redirect_to(new_user_session_url)
      end
    end

    context 'when signed in' do
      before do
        test_user.confirm
        sign_in test_user
      end

      it 'shows user profile' do
        get :show, params: { id: test_user.id }
        expect(response).to render_template('users/show')
      end
    end
  end
end
