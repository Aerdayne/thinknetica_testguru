class TakenTestsController < ApplicationController
  before_action :authenticate_user!
  before_action :identify_taken_test, only: %i[gist show result update]

  def show
    if @taken_test.current_question.nil?
      flash[:alert] = 'Test is invalid, sorry for the inconvenience'
      redirect_to tests_path
    end
  end

  def result; end

  def update
    @taken_test.accept!(params[:answer_ids])
    if @taken_test.completed?
      TestsMailer.completed_test(@taken_test).deliver_now

      flash[:alert] = 'Time is up!' unless @taken_test.timed?

      badges = BadgeDispenserService.new(@taken_test).parse_criteria
      if badges.any?
        current_user.badges << badges
        flash[:notice] = 'You just acquired a new badge! Check your badge tab'
      end

      redirect_to result_taken_test_path(@taken_test)
    else
      render :show
    end
  end

  def gist
    question = @taken_test.current_question
    result = GistQuestionService.new(question).call
    if result.success?
      current_user.gists.create(question: question, url: result.html_url)
      flash[:notice] = t('.success', url: helpers.link_to('Gist', result.html_url, target: '_blank'))
    else
      flash[:alert] = t('.failure')
    end
    redirect_to @taken_test
  end

  private

  def identify_taken_test
    @taken_test = TakenTest.find(params[:id])
  end
end
