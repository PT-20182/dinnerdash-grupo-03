class ControlUsersController < ApplicationController
  before_action :check_user
  def index
    @users = User.all
  end
  private

  def check_user
    unless user_signed_in? && current_user.admin
      redirect_to :root
    end
  end

end
