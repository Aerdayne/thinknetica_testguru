class TakenTestsController < ApplicationController
  before_action :authenticate_user!
  before_action :identify_taken_test, only: %i[gist show result update]

  def show; end

  def result; end

  def update
    @taken_test.accept!(params[:answer_ids])
    if @taken_test.completed?
      TestsMailer.completed_test(@taken_test).deliver_now
      redirect_to result_taken_test_path(@taken_test)
    else
      render :show
    end
  end

  def gist
    question = @taken_test.current_question
    result = GistQuestionService.new(question).call
    flash_options = if result
                      current_user.gists.create(question: question, user: current_user, url: result['html_url'])
                      { notice: t('.success', url: result['html_url']) }
                    else
                      { alert: t('.failure') }
                    end
    redirect_to @taken_test, flash_options
  end

  private

  def identify_taken_test
    @taken_test = TakenTest.find(params[:id])
  end

end
