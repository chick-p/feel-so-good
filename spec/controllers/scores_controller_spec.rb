require 'rails_helper'

RSpec.describe ScoresController, type: :controller do

  before do
    @user = FactoryBot.create(:user)
    @score = FactoryBot.create(:score, user: @user)
    session[:user_id] = @user.id
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: @score.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: { id: @score.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #edit" do
    it "returns http redirect" do
      post :update, params: { id: @score.id,
                              score: {
                                wakeup_on: '2017-08-20',
                                score: 3,
                                reason: 'foo',
                                cause: 'bar'
                              }
                            }
      expect(response).to have_http_status(302)
    end
  end

  describe "DELETE #destroy" do
    context 'visible score' do
      it "returns http redirect" do
        delete :destroy, params: { id: @score.id }
        expect(response).to have_http_status(302)
      end
    end
  end
end
