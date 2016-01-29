class PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.new(params.require(:post).permit(:post))
    @post.user = current_user
    @post.save

    redirect_to timeline_index_path
  end
end
