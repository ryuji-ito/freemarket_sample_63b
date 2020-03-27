require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe 'GET #buy_complete' do
    it 'returns http success' do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

end