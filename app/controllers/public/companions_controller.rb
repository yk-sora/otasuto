class Public::CompanionsController < ApplicationController
  
  def show
    @user = current_user
  end
  
  def edit
    @user = current_user
  end
  
  def update
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
