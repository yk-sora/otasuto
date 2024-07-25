class Public::PostsController < ApplicationController
  
  def new
    @posts = Post.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      redirect_to @image, notice: "画像が投稿されました。"
    else
      render :new
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  private

  def image_params
    params.require(:image).permit(:title, :description, :image_data)
  end

  
end
