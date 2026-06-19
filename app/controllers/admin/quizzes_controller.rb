class Admin::QuizzesController < ApplicationController
  before_action :authorize_admin
  before_action :set_quiz, only: [:edit, :update, :destroy]

  def index
    @quizzes = Quiz.order(created_at: :desc).page(params[:page]).per(15)
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = current_user.quizzes.new(quiz_params)

    if @quiz.save
      redirect_to admin_quizzes_path, notice: "Quiz created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @quiz.update(quiz_params)
      redirect_to admin_quizzes_path, notice: "Quiz updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @quiz.destroy
    redirect_to admin_quizzes_path, notice: "Quiz deleted successfully!"
  end

  private

  def set_quiz
    @quiz = Quiz.find(params[:id])
  end

  def quiz_params
    params.require(:quiz).permit(:title, :description, :category, :is_published)
  end
end
