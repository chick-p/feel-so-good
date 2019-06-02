# frozen_string_literal: true

class MeController < ApplicationController
  def index
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(me_params)
      redirect_to me_path, notice: "#{@user.name} を更新しました。"
    else
      render :edit
    end
  end

  private

  def me_params
    params.permit(:name, :email, :password)
  end
end
