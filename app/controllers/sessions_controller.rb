class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  
  def new
    redirect_to dashboard_path if logged_in?
  end
  
  def create
    user = User.find_by(email: params[:email].downcase)
    
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path, notice: "Welcome back, #{user.email}!"
    else
      flash.now[:alert] = "Invalid email or password"
      render :new, status: :unprocessable_entity
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Successfully logged out"
  end
end