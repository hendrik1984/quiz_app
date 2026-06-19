class Admin::UsersController < ApplicationController
  before_action :authorize_admin
  before_action :set_user, only: [:toggle_admin]

  def index
    @users = User.order(created_at: :desc).page(params[:page]).per(20)
  end

  def toggle_admin
    # Prevent demoting the last admin
    if @user.is_admin? && User.where(is_admin: true).count == 1
      redirect_to admin_users_path, alert: "Cannot demote the last administrator"
    else
      @user.update(is_admin: !@user.is_admin)
      redirect_to admin_users_path, notice: "User role updated successfully"
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
