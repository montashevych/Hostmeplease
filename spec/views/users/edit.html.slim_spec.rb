require 'rails_helper'

RSpec.describe 'users/edit.html.slim', type: :view do
  context 'when template rendered' do
    let(:user) { FactoryBot.create(:user, :confirmed) }

    it 'infers the controller path' do
      expect(controller.controller_path).to eq('users')
    end

    it 'infers the controller action' do
      expect(controller.request.path_parameters[:action]).to eq('edit')
    end

    it 'rendered partial to Show page' do
      sign_in user
      @user = user
      @user_form = UserForm.new(user: user)
      render
      expect(rendered).to match(/text/)
    end
  end
end