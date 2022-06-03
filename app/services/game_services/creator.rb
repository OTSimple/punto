class GameServices::Creator < ApplicationService
  attr_reader(
    :game,
    :user
  )

  def initialize(user: nil)
    @user = user
  end

  def call
    puts "user = #{@user.inspect}"
    @game = Game.new
    @game.players.build(user: @user, owner: true)
    @game.short_tokens.build(token: SecureRandom.hex(2))

    @game.save

    self
  end

  private

end