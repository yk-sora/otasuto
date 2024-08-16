class Public::PostCommentsController < ApplicationController

  def index
    @post_comments = PostComment.all
  end

  def show
    @post_comment = PostComment.find(params[:id])
  end

  def new
    @post_comment = PostComment.new
  end


  #def create
    #@post_comment = PostComment.new(post_comment_params)
    #if @post_comment.save
      #redirect_to @post_comment, notice: 'コメントが作成されました。'
    #else
      #render :new
    #end
  #end
  
  def create
    @post = Post.find(params[:post_id])
    @post_comment = @post.post_comments.new(post_comment_params)

    if @post_comment.save
      redirect_to @post, notice: 'コメントが投稿されました。'
    else
      redirect_to @post, alert: 'コメントの投稿に失敗しました。'
    end
  end

  def edit
    @post_comment = PostComment.find(params[:id])
  end

  def update
    @post_comment = PostComment.find(params[:id])
    if @post_comment.update(post_comment_params)
      redirect_to @post_comment, notice: 'コメントが更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @post_comment = PostComment.find(params[:id])
    @post_comment.destroy
    redirect_to post_comments_url, notice: 'コメントが削除されました。'
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:content, :post_image)
  end
end
