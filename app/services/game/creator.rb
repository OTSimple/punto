class Game::Creator < ApplicationService
  attr_reader(
    :game,
    :user
  )

  def initialize(params)
    @params = params
  end

  def call
    if @params[:user_pseudo]
      @user = User.create(pseudo: @params[:user_pseudo])
      @game = Game.create
    end

    self
  end

  private

end