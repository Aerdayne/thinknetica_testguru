class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :identify_question, only: %i[new create]
  before_action :identify_answer, only: %i[show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_record_not_found

  def show; end

  private

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
