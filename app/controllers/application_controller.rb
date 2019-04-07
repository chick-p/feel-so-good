class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :login_required

  private
  def current_user
    @current_user ||= find_user
  end

  def find_user
    if session[:user_id]
      User.find_by(id: session[:user_id])
    elsif request.headers['X-Feel-So-Good-Authorization']
      User.find_by(token: request.headers['X-Feel-So-Good-Authorization'])
    else
      nil
    end
  end


  def login_required
    redirect_to login_path unless current_user
  end
end
