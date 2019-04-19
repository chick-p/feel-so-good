class SessionsController < ApplicationController
  skip_before_action :login_required, only: [:new, :create, :omniauth]

  def new
    reset_session
    @isTwitter = ENV["TWITTER_ENABLED"]
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

  def omniauth
    user = User.find_for_oauth(request.env['omniauth.auth'])
    if user.persisted?
      session[:user_id] = user.id
      redirect_to root_path, notice: 'ユーザー認証が完了しました。'
    else
      flash.now[:alert] = 'ユーザー認証に失敗しました。'
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'ログアウトしました。'
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
