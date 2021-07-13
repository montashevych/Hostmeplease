require 'rails_helper'

RSpec.describe UsersController do
  describe 'profile page' do
    let(:test_user) { FactoryBot.build(:user, password: 'asdasd', password_confirmation: 'asdasd') }

    context 'when not signed in' do
      it 'redirects to /sign_in' do
        get :show, params: { id: test_user.id }
        expect(response).to redirect_to(new_user_session_url)
      end
    end

    context 'when signed in' do
      it 'shows user profile' do
        test_user.confirm
        sign_in test_user
        get :show, params: { id: test_user.id }
        expect(response).to render_template('users/show')
      end

      it 'edit user profile' do
        test_user.confirm
        sign_in test_user
        get :edit, params: { id: test_user.id }
        expect(response).to render_template('users/edit')
      end
    end

    context 'when User want update his data' do
      it 'redirects to the user path on succesful save' do
        test_user.confirm
        sign_in test_user
        put :update, params: { first_name: 'Maksym',
                               last_name: 'Budko',
                               email: 'maksym@gmail.com',
                               phone_number: '+380963451234' }
        expect(:params).to be_valid
        response.should redirect_to(user_path(user))
      end

      it "renders the edit screen again with errors if the model doesn't save" do
        test_user.confirm
        sign_in test_user
        put :update, params: { first_name: 'Maksym',
                               last_name: '',
                               email: 'maksym@gmail.com',
                               phone_number: '+380963451234' }
        expect(:params).not_to be_valid
        response.should render_template('edit')
      end
    end
  end
end
