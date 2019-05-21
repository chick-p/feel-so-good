require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    before do
      @user = FactoryBot.create(:user)
    end

    context 'with valid password' do
      it "returns http success" do
        post :create, params: { session: { email: 'test1@example.com', password: 'password' } }
        expect(response).to have_http_status(302)
      end
    end

    context 'with invalid password' do
      it "returns http redirect" do
        post :create, params: { session: { email: 'test1@example.com', password: 'wrong' } }
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "DELETE #destroy" do
    before do
      @user = FactoryBot.create(:user)
      session[:user_id] = @user.id
    end

    it "returns http success" do
      delete :destroy
      expect(response).to have_http_status(302)
    end
  end
end
