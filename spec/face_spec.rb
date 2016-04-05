require_relative 'spec_helper.rb'

describe Face do

  before :each do
    @a = Vertex.new
    @b = Vertex.new
    @c = Vertex.new
    @A = @a.connect(@b)
    @B = @b.connect(@c)
    @C = @a.connect(@c)
    @d = Vertex.new
    @D = @d.connect(@b)
    @goodface1 = Face.new([@B, @A, @C])
    @e = Vertex.new
    @E = @e.connect(@a)
    @F = @c.connect(@e)
    @goodface2 = Face.new([@C, @E, @F])
  end

  describe "#initialize" do
    it "makes the face with the edges" do
      array_compare(@goodface1.edges, [@A, @B, @C]).should eql true
    end
    it "includes the contained vertices" do
      array_compare(@goodface2.vertices, [@a, @e, @c]).should eql true
      array_compare(@goodface2.vertices, [@a, @b, @c]).should eql false

    end
    it "returns an error if edges aren't cyclic" do
      expect {Face.new([@D, @A, @B])}.to raise_error
    end
  end

  describe "#add_neighbor" do
    it "#adds a neighbor" do
      @goodface1.add_neighbor(@goodface2)
      vert_share = @goodface1.neighboring_faces[0]["shared_vertices"]
      array_compare(vert_share, [@a, @c]).should eql true
    end
  end

end
