require_relative 'spec_helper.rb'

describe Face do
  before :each do
    @a = Vertex.new
    @b = Vertex.new
    @c = Vertex.new
    @A = @a.make_connection(@b)
    @B = @b.make_connection(@c)
    @C = @a.make_connection(@c)
    @face = Face.new(@A, @B, @C)
  end

  describe "#make_connection" do
    it "makes connections with b and a and c" do
      @b.connections.should eql [@a, @c]
    end

    it "saves the edge connections" do
      @b.edges.should eql [@A, @B]
      @C.connection.should eql [@e, @f]
      @graph.edges.should eql [@A, @B, @C]
    end

    it "raises error when connection already exists" do
      expect {@graph.make_connection(@a,@b)}.to raise_error("already connected")
    end
  end
  #
  # describe "#break_connection" do
  #   it "breaks connections with a and b" do
  #     @graph.break_connection(@a, @b)
  #     @a.connections.should eql []
  #     @b.connections.should eql [@c]
  #     @graph.edges.should eql [@B, @C]
  #   end
  # end
  #
  # describe "#remove_vertex" do
  #   it "removes an unconnected vertex from the catalog" do
  #     @graph.break_connection(@a, @b)
  #     @graph.remove_vertex(@a)
  #     @graph.vertices.should eql [@b, @c, @d, @e, @f]
  #   end
  #   it "raises error if vertex has connections" do
  #     expect {@graph.remove_vertex(@e)}.to raise_error("Vertex has edges.  Break them first.")
  #   end
  # end
  #
  # describe "#is_connected?" do
  #   it "returns positive if vertices are connected" do
  #     @graph.is_connected?(@e, @f).should eql(true)
  #   end
  #   it "returns negative if vertices are not connected" do
  #     @graph.is_connected?(@e, @d).should eql (false)
  #   end
  # end
  #
  # describe "#find_connection" do
  #   it "returns the edge connecting two vertices" do
  #     @graph.find_connection(@a,@b).should eql @A
  #   end
  #   it "returns nil if the vertices are unconnected" do
  #     @graph.break_connection(@a,@b)
  #     @graph.find_connection(@a,@b).should eql nil
  #   end
  # end

end
