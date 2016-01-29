class TimelineController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = Post.new
    page = params.permit(:page)[:page]
    @posts = Post.where( :user => Follow.where(follower: current_user).pluck( :followed_id ) ).paginate(:page => page, :per_page => 10)
  end

end
