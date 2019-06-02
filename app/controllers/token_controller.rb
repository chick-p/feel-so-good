# frozen_string_literal: true

class TokenController < ApplicationController
  def index
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(token: SecureRandom.alphanumeric(20))
      redirect_to me_token_path, notice: 'API Token を更新しました。'
    else
      render :edit
    end
  end
end
