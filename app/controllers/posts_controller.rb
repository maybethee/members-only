class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      puts @post.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end



  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
