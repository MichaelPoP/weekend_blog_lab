class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @author = Author.find params[:author_id]
    # @post = Post.find params[:id]
    @posts = @author.posts
    # @author = Author.find params[:id]

  end

  def new
    @authors = Author.find params[:author_id]
    @post = Post.new
  end

  def create
    @author = Author.find params[:author_id]
    @post = Post.new post_params
    @post.author = @author
    if @post.save
      redirect_to author_posts_path, flash: { success: "New Post Created!" } #(@author)
    else 
      render :new
    end
  end

  def show
    # @post = Post.find params[:id]
    @author = @post.author
  end

  def edit
    # @post = Post.find params[:id]
    @author = @post.author
  end

  def update
    # @post = Post.find params[:id]
    @post.update_attributes post_params
    @author = @post.author
    if @post.save
      redirect_to post_path, flash: { success: "Post Updated!" }
    else
      render :edit
    end
  end

  def destroy
    post = Post.find params[:id]
    post.destroy
    redirect_to author_posts_path(post.author), flash: { warning: "Post Deleted" }
  end


  private 
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :category, :author_id)
  end
end










