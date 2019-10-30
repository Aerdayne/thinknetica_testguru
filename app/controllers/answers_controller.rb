class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :identify_question, only: %i[new create]
  before_action :identify_answer, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_record_not_found

  def show; end

  def new
    @answer = @question.answers.new
  end

  def create
    @answer = @question.answers.new(answer_params)
    if @answer.save
      redirect_to @answer
    else
      render :new
    end
  end

  def edit; end

  def update
    if @answer.update(answer_params)
      redirect_to @answer
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to @answer.question
  end

  private

  def answer_params
    params.require(:answer).permit(:correct, :content)
  end

  def identify_answer
    @answer = Answer.find(params[:id])
  end

  def identify_question
    @question = Question.find(params[:question_id])
  end

  def rescue_from_record_not_found(error)
    render plain: error.message
  end
end
