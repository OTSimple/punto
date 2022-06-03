class GameServices::Creator < ApplicationService
  attr_reader(
    :game,
    :user
  )

  def initialize(user: nil)
    @user = user
  end

  def call
    @game = Game.new(state: "waiting")
    @game.players.build(user_id: @user.id, owner: true)
    @game.short_tokens.build(token: SecureRandom.hex(2))

    @game.save

    build_success_response

    self

    rescue StandardError => e
      build_failed_response(e)
      self
    rescue NoMethodError => e
      build_failed_response(e)
      self
  end

  private

end