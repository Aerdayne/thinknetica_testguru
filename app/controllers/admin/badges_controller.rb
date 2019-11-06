class Admin::BadgesController < Admin::BaseController
  before_action :set_badges, only: %i[index]
  before_action :identify_badge, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_record_not_found

  def show; end

  def index; end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to admin_badge_path(@badge)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badge_path(@badge)
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def set_badges
    @badges = Badge.all
  end

  def identify_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:name, :description, :image_path, :image_path, :criterion, :value)
  end

  def rescue_from_record_not_found(error)
    render plain: error.message
  end
end
