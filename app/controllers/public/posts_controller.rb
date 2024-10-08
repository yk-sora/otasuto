class Public::PostsController < ApplicationController
  
  def new
    @post = Post.new
  end
  
  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post, notice: '投稿が成功しました！'
    else
      render :new
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: '投稿が削除されました。'
  end
  
  private

  def post_params
    params.require(:post).permit(:name, :introduction, :image)
  end

  
end
