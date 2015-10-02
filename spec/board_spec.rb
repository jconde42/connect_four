require "spec_helper"

describe Board do

  before :each do
    @empty_board = Board.new
    @full_board = Board.new (Array.new(7,Array.new(6,"X")))
  end

  describe "#new" do
    it "starts with an empty array" do
      expect(@empty_board.arr).to eq(Array.new(7) { Array.new(6) })
    end
  end

  describe ".add" do
    it "varifies a valid column" do
      expect(@empty_board.add 3,"X").to be true
      expect(@full_board.add 3,"X").to be false
    end

    it "places the player_piece to the correct place" do
      player_piece = "X"
      board = Board.new
      board.arr = [["X","X",nil],["X",nil,nil],[nil,nil,nil]]
      board.add 1,"X"
      expect(board.arr).to \
        eq([["X","X","X"],["X",nil,nil],[nil,nil,nil]])
      board.add 3,"X"
      expect(board.arr).to \
        eq([["X","X","X"],["X",nil,nil],["X",nil,nil]])
    end
  end


  describe ".display" do
    it "outputs the array to_stdout" do
      board = Board.new ( [ [nil,nil,nil],["X","X",nil],["O","X",nil] ] )
      expect {board.display}.to \
        output(" CONNECT FOUR \n| || || |\n| ||X||X|\n| ||X||O|\n 1  2  3 ").to_stdout
    end
  end


  describe ".winner?" do
  end
end
