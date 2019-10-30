class TakenTestsController < ApplicationController
  before_action :authenticate_user!
  before_action :identify_taken_test, only: %i[show result update]

  def show; end

  def result

  end

  def update
    @taken_test.accept!(params[:answer_ids])
    if @taken_test.completed?
      redirect_to result_taken_test_path(@taken_test)
    else
      render :show
    end
  end

  private

  def identify_taken_test
    @taken_test = TakenTest.find(params[:id])
  end

end
