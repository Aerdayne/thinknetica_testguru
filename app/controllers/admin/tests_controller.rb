class Admin::TestsController < Admin::BaseController
  before_action :identify_test, only: %i[start show edit update destroy]

  def show; end

  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.authored_tests.new(test_params)
    if @test.save
      redirect_to admin_test_path(@test)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test)
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  private

  def test_params
    params.require(:test).permit(:title, :content, :level, :category_id)
  end

  def identify_test
    @test = Test.find(params[:id])
  end

end
