class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :identify_test, only: %i[start show edit update destroy]

  def start
    current_user.tests.push(@test)
    redirect_to current_user.taken_test(@test)
  end

  def show; end

  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    @test.author = current_user
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  private

  def test_params
    params.require(:test).permit(:title, :content, :level, :category_id)
  end

  def identify_test
    @test = Test.find(params[:id])
  end

end
