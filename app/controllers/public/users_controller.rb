class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @bulletin_boards = current_user.bulletin_boards
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :image, :introduction, :sex)
    end
end
