class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :authenticate_correct_user!, :except => [:index, :show]

  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag]).order("created_at DESC")
    else
      @posts = Post.all.order("created_at DESC")
    end
    @book_reviews = BookReview.all
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
    @post = Post.friendly.find(params[:id])
  end

  def update
    post = Post.friendly.find(params[:id])
    post.update_attributes!(post_params)
    redirect_to post_path(params[:id])
  end

  def destroy
    post = Post.friendly.find(params[:id])
    post.destroy!
    redirect_to root_url
  end

  def show
    @post = Post.friendly.find(params[:id])
    @next_post = Post.find(@post.next_post.to_i) if @post.next_post
  end

  private

    def post_params
      params.require(:post).permit(:title, :content, :body_html, :image, :short, :tag_list, :next_post) if params[:post]
    end

    def authenticate_correct_user!
      redirect_to posts_path if current_user.email.downcase != "yangsunwoo@gmail.com"
    end
end
