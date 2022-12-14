class Public::LikesController < ApplicationController
  def create
    @like = current_user.likes.create(bulletin_board_id: params[:bulletin_board_id])
    redirect_back(fallback_location: bulletin_boards_path)
    @bulletin_board = @like.bulletin_board
    @like.save
    bulletin_board = BulletinBoard.find(params[:bulletin_board_id])
    bulletin_board.create_notification_like!(current_user)
    respond_to :js
  end

  def destroy
    @like = Like.find_by(bulletin_board_id: params[:bulletin_board_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: bulletin_boards_path)
  end
end
