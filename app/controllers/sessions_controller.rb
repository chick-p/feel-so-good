class SessionsController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: session_params[:email])

    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'ログインしました。'
    else
      flash.now[:alert] = 'ID かパスワードが違います。'
      render :new
    end
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
