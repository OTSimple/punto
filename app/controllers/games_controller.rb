class GamesController < ApplicationController
  def create
    service = GameServices::Creator.call(user: current_or_guest_user)

    respond_to do |format|
      if service
        puts "Service = #{service.game.id}"
        format.html { redirect_to play_game_path(service.game.id)}
      else
      end
    end
  end

  def play
    @game = Game.find(params[:id])
  end

  private

  def game_params
    params.require(:game)
  end
end
