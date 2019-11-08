class GivenBadgesController < ApplicationController
  before_action :authenticate_user!

  def index
    @badges = current_user.given_badges.group(:badge_id)
  end
end
