class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.recent_posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    # @comments = @post.comments.all
  end

  def new
    @post = Post.new
  end

  def create
    new_post = Post.new(post_params)
    current_user.posts << new_post

    if new_post.save
      redirect_to user_posts_path(new_post.user.id), notice: 'Post created!'
    else
      flash.now[:alert] = 'Failed to publish post!'
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
