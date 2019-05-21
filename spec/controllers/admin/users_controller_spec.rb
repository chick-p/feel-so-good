require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do
  before do
    @user = FactoryBot.create(:user, admin: true)
    session[:user_id] = @user.id
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: { id: @user.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: @user.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #update" do
    it "returns http redirect" do
      post :update, params: { id: @user.id,
                              user: {
                                name: 'foo',
                                email: 'bar@example.com',
                                admin: false,
                                password: 'baz'
                              }
                            }
      expect(response).to have_http_status(302)
    end
  end

  describe "PUT #create" do
    it "returns http redirect" do
      put :create, params: { user: {
                                name: 'hoge',
                                email: 'fuga@example.com',
                                admin: false,
                                password: 'piyo'
                              }
                            }
      expect(response).to have_http_status(302)
    end
  end

  describe "DELETE #destroy" do
    it "returns http redirect" do
      delete :destroy, params: { id: @user.id }
      expect(response).to have_http_status(302)
    end
  end
end
