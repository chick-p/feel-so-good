require 'rails_helper'

RSpec.describe Admin::TokensController, type: :controller do
  before do
    @user = FactoryBot.create(:user, admin: true)
    session[:user_id] = @user.id
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { user_id: @user.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #update" do
    it "returns http redirect" do
      post :update, params: { user_id: @user.id }
      expect(response).to have_http_status(302)
    end
  end
end
