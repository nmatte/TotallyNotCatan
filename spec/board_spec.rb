require_relative 'spec_helper.rb'

describe Board do

  before :each do
    @the_board = Board.new
  end

  describe "#initialize" do
    it "builds the board with 7 tiles" do
      expect(@the_board.faces.length).to eq(7)
    end
    it "builds the board with neighbors (1 vertex, 3 faces)" do
      vertex = @the_board.vertices.first
      expect(@the_board.find_neighbors([vertex]).length).to eq(3)
    end
  end

end
