class Admin::QuestionsController < ApplicationController
  before_action :authorize_admin
  before_action :set_quiz
  before_action :set_question, only: [:edit, :update, :destroy]

  def new
    @question = @quiz.questions.new
    @question.options.build
  end

  def create
    @question = @quiz.questions.new(question_params)

    if @question.save
      redirect_to edit_admin_quiz_path(@quiz), notice: "Question added successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to edit_admin_quiz_path(@quiz), notice: "Question updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @question.destroy
    redirect_to edit_admin_quiz_path(@quiz), notice: "Question deleted successfully!"
  end

  private

  def set_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end

  def set_question
    @question = @quiz.questions.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:text, :points, :order_index,
                                    options_attributes: [:id, :text, :is_correct, :_destroy])
  end
end
