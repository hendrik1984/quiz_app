class HomeController < ApplicationController
  def index
    if logged_in?
      redirect_to dashboard_path
    end
  end
  
  def dashboard
    puts 'im called home controller'
    authorize_user
    @user = current_user
    @total_quizzes_taken = 0
    @average_score = 0
  end
end