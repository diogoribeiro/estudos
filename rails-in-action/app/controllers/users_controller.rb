class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    page = params.permit(:page)[:page]
    @users = User.where.not(:id => current_user).paginate(:page => page, :per_page => 10)
  end

  def follow
    followed_user = User.find_by(id: params.require(:followed_user))
    follow = Follow.new(followed: followed_user, follower: current_user)
    follow.save!

    redirect_to users_index_path
  end
end
