class SessionsController < ApplicationController
  def new; end

  def create 
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session[:target_url] || root_path
    else
      flash.now[:alert] = 'Verify your email and password.'
      render :new
    end
    session[:target_url] = nil
  end

  def destroy
    session[:user_id] = nil
    redirect_to signin_path
  end
end
