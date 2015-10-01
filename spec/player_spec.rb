require "spec_helper"

describe Player do
  before :all do
    @playerX = Player.new "X"
    @playerO = Player.new "O"
  end

  describe "#new" do
    it "sets @piece" do
      expect(@playerX.piece).to eq "X"
      expect(@playerO.piece).to eq "O"
    end
  end
end
