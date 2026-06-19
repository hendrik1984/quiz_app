class QuizzesController < ApplicationController
  before_action :authorize_user, only: [:index, :show]

  def index
    @quizzes = Quiz.published.order(created_at: :desc).page(params[:page]).per(12)

    if params[:category].present?
      @quizzes = @quizzes.by_category(params[:category])
    end

    @categories = Quiz.published.distinct.pluck(:category).compact
  end

  def show
    @quiz = Quiz.published.find(params[:id])
  end
end
