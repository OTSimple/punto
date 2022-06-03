require 'rails_helper'


RSpec.describe GameServices::Creator do

  before(:each) do
    Game.destroy_all
  end

  describe "#call" do
    let!(:user) { create(:guest_user) }

    it "should create a new game" do
      service = GameServices::Creator.call(user: user)

      expect(service.game.persisted?).to be true
    end

    it "should have created one player who is the owner of the game" do
      service = GameServices::Creator.call(user: user)

      expect(service.game.players.count).to eq(1)
      expect(service.game.players.first.owner).to be true
    end

    it "should have generated one short token" do
      service = GameServices::Creator.call(user: user)
      game = service.game

      expect(game.short_tokens.count).to eq(1)
      expect(game.short_tokens.first.token).not_to be_empty
    end
  end
end