class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  private

  def authenticate_user!
    return if current_user

    session[:target_url] = request.url
    redirect_to signin_path, alert: 'Verify your email and password'
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
