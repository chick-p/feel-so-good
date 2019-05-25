require 'rails_helper'

RSpec.describe MeController, type: :controller do

  before do
    @user = FactoryBot.create(:user, admin: true)
    session[:user_id] = @user.id
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: { id: @user.id }
      expect(response).to have_http_status(:success)
    end
  end

end
