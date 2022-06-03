class GamesController < ApplicationController
  def create
    service = Game::Creator.call(game_params)

    respond_to do |format|
      if service
        format.html { redirect_to play_game_path(service.game) }
      else
      end
    end
  end

  def play
    @game = Game.find(params[:id])
  end

  private

  def game_params
    params.require(:game).permit(:user_pseudo)
  end
end
