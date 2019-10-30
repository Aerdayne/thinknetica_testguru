class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :identify_test, only: %i[start]

  def start
    current_user.tests.push(@test)
    redirect_to current_user.taken_test(@test)
  end

  def index
    @tests = Test.all
  end

  private

  def identify_test
    @test = Test.find(params[:id])
  end

end
