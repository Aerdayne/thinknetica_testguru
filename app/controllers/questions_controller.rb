class QuestionsController < ApplicationController
  before_action :identify_test, only: [:create]
  before_action :identify_question, only: %i[show edit destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_record_not_found
  def index
    render plain: Question.all.inspect
  end

  def new; end

  def edit; end

  def show
    render plain: @question.inspect
  end

  def create
    @test.questions.create!(question_params)
    render plain: 'Test created!'
  end

  def destroy
    @question.destroy
  end

  private

  def question_params
    params.require(:question).permit(:content)
  end

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
