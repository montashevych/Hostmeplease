require 'rails_helper'

RSpec.describe 'Places', type: :request do
  describe 'GET /index' do
    context 'when was successfull status' do
      it 'returns http success' do
        get places_path
        expect(response).to have_http_status(:success)
      end
    end
  end
end
