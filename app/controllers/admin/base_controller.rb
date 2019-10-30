class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_permission

  layout 'admin'

  private

  def admin_permission
    redirect_to root_path, alert: 'You don\'t have necessary privileges to access this page.' unless current_user.is_a?(Admin)
  end
end