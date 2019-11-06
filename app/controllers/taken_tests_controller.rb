class TakenTestsController < ApplicationController
  before_action :authenticate_user!
  before_action :identify_taken_test, only: %i[gist show result update]

  def show; end

  def result
    return unless @taken_test.successful == true

    BadgeDispenserService.new.parse_criteria(@taken_test).each do |badge|
      unless badge.nil?
        current_user.badges << badge
        flash.now[:notice] = "You have been awarded with a '#{badge.name}' badge!"
      end
    end
  end

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
