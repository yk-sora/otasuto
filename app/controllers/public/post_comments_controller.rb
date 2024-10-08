class Public::PostCommentsController < ApplicationController

  def index
    #@post_comments = PostComment.all
    @post = Post.find(params[:post_id])
    @post_comments = @post.post_comments
  end

  def show
    @post_comment = PostComment.find(params[:id])
  end

  def new
    @post = Post.find(params[:post_id])
    @post_comment = @post.post_comments.new
  end
  
  def create
    @post = Post.find(params[:post_id])
    @post_comment = @post.post_comments.new(post_comment_params)

    if @post_comment.save
      redirect_to @post, notice: 'コメントが投稿されました。'
    else
      redirect_to @post, alert: 'コメントの投稿に失敗しました。'
    end
  end

  #def edit
    #@post_comment = PostComment.find(params[:id])
  #end

  def update
    @post_comment = PostComment.find(params[:id])
    if @post_comment.update(post_comment_params)
      redirect_to @post_comment.post, notice: 'コメントが更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @post_comment = PostComment.find(params[:id])
    @post_comment.destroy
    #redirect_to post_comments_url, notice: 'コメントが削除されました。'
    redirect_to @post_comment.post, notice: 'コメントが削除されました。'
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:content, :post_id, :image)
  end
end
