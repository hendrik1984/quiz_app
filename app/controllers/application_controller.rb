class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :admin?

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def admin?
    current_user&.is_admin?
  end

  def authorize_user
    redirect_to login_path, alert: 'Please log in to access this page' unless logged_in?
  end

  def authorize_admin
    redirect_to root_path, alert: 'Access denied. Admin privileges required.' unless admin?
  end

end
