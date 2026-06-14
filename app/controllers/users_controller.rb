class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  
  def new
    @user = User.new
    redirect_to dashboard_path if logged_in?
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path, notice: "Account created successfully! Welcome!"
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def show
    @user = User.find(params[:id])
    authorize_access(@user)
  end
  
  def edit
    @user = User.find(params[:id])
    authorize_access(@user)
  end
  
  def update
    @user = User.find(params[:id])
    authorize_access(@user)
    
    if @user.update(user_params)
      redirect_to @user, notice: "Profile updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
  
  def authorize_access(user)
    unless current_user == user || admin?
      redirect_to root_path, alert: "You don't have permission to access this page"
    end
  end
end