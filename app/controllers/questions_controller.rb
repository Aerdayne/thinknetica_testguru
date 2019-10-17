class QuestionsController < ApplicationController
  before_action :identify_test, only: %i[new create]
  before_action :identify_question, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_record_not_found

  def show; end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to @question.test
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
