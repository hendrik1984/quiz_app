class Admin::DashboardController < ApplicationController
  before_action :authorize_admin
  
  def index
    puts "im called dashboard "
    @total_users = User.count
    @admin_count = User.where(is_admin: true).count
    @regular_users_count = User.where(is_admin: false).count
    @recent_users = User.order(created_at: :desc).limit(5)
    byebug
  end
end