require_relative 'spec_helper.rb'

describe Board do

  before :each do
    @the_board = Board.new

  end

  describe "#initialize" do
    it "builds the board with 7 tiles" do
      expect(@the_board.board.faces.length).to eq(7)
    end
  end

end
