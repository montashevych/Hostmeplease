require 'rails_helper'

RSpec.describe UsersController do
  context 'when profile page' do
    let(:test_user) { FactoryBot.build(:user) }

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
      let(:user) { FactoryBot.build(:user) }

      before do
        user.confirm
        sign_in user
      end

      it 'redirects  on user path if succesful save' do
        put :update,
            params: { id: user.id, user_form: { first_name: 'Maksym', last_name: 'Budko', email: 'maksym@gmail.com',
                                                phone_number: '+380963451234' } }
        expect(response).to redirect_to(user_path(id: user.id))
      end

      it "renders the edit screen if the model doesn't save" do
        put :update,
            params: { id: user.id, user_form: { first_name: 'Maksym', last_name: '', email: 'maksym@gmail.com',
                                                phone_number: '+380963451234' } }
        expect(response).to render_template('edit')
      end
    end
  end
end
