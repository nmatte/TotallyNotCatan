require_relative 'spec_helper.rb'

describe Board do

  before :each do
    @the_board = Board.new
  end

  describe "#initialize" do
    it "builds the board with 19 tiles" do
      expect(@the_board.faces.length).to eq(19)
    end
    it "builds the board with neighbors (1 vertex, 3 faces)" do
      vertex = @the_board.vertices.first
      expect(@the_board.find_neighbors([vertex]).length).to eq(3)
    end
    describe "matches specification on 19 hex board" do
      it "has a 19th face that has the 3 correct neighbors" do
        expect(@the_board.find_face_neighbors(@the_board.faces[18]).length).to eq(3)
        expect(@the_board.find_face_neighbors(@the_board.faces[18])).to match_array([ @the_board.faces[6], @the_board.faces[7], @the_board.faces[17] ])
      end
    end
  end

end
