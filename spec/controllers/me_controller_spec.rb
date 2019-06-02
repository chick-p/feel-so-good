# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MeController, type: :controller do
  before do
    @user = FactoryBot.create(:user, admin: true)
    session[:user_id] = @user.id
  end

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #edit' do
    it 'returns http success' do
      get :edit, params: { id: @user.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #update' do
    it 'returns http redirect' do
      post :update, params: { id: @user.id,
                              user: {
                                name: 'foo',
                                email: 'bar@example.com',
                                admin: false,
                                password: 'baz'
                              } }
      expect(response).to have_http_status(302)
    end
  end
end
