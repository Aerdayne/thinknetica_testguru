class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :identify_test, only: %i[new create]
  before_action :identify_question, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_record_not_found

  def show; end

  private

  def identify_test
    @test = Test.find(params[:test_id])
  end

  def identify_question
    @question = Question.find(params[:id])
  end

  def rescue_from_record_not_found(error)
    render plain: error.message
  end
end
