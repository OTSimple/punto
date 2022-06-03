require 'rails_helper'

RSpec.describe GameMaster, type: :module do
  describe "GameMaster#are_adjacents?" do
    context "coordinates are not adjacents" do
      it "should return false" do
        expect(GameMaster.are_adjacents?([0,0], [2,1])).to be(false)
      end
    end

    context "coordinates are adjacents" do
      it "should return true" do
        expect(GameMaster.are_adjacents?([1,1], [2,1])).to be(true)
      end
    end

    context "coordinates are equals" do
      it "should return true" do
        expect(GameMaster.are_adjacents?([1,1], [1,1])).to be(true)
      end
    end
  end
end
