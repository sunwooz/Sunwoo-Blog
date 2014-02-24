class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    if post.save
      puts "Saved!"
    else
      puts "Not saved!"
    end
    redirect_to root_url
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update_attributes!(post_params)
    redirect_to root_url
  end

  def destroy
    post = Post.find(post_params[:id])
    post.destroy!
    redirect_to root_url
  end

  def show
    @post = Post.find(params[:id])
  end

  private

    def post_params
      params.require(:post).permit(:title, :content, :body_html) if params[:post]
    end
end
