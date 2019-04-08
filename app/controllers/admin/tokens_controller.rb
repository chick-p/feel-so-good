class Admin::TokensController < ApplicationController
  before_action :reqire_admin

  def show
    @user = User.find(params[:user_id])
    @token = @user.token
  end

  def update
    @user = User.find(params[:user_id])

    if @user.update({token: SecureRandom.alphanumeric(20)})
      redirect_to admin_user_token_path(@user), notice: "API Token を更新しました。"
    else
      render :edit
    end
  end

  private

  def reqire_admin
    redirect_to root_path unless current_user.admin?
  end
end
