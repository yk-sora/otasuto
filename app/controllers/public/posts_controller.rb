class Public::PostsController < ApplicationController
  
  def new
    @post = Post.new
  end

  def create
    @posts = Post.new(posts_params)
    if @posts.save
      redirect_to @posts, notice: "投稿が成功しました。"
    else
      render :new
    end
  end

  def show
    @posts = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  private

  def posts_params
    params.require(:post).permit(:name, :introduction, :image)
  end

  
end
