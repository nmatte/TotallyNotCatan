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

    # Disconnected face
    @x = Vertex.new
    @y = Vertex.new
    @z = Vertex.new
    @X = @x.connect(@y)
    @Y = @y.connect(@z)
    @Z = @x.connect(@z)
    @disface = Face.new([@X, @Y, @Z])

  end

  describe "#initialize" do
    it "makes the face with the edges" do
      expect(array_compare(@goodface1.edges, [@A, @B, @C])).to eq(true)
    end
    it "includes the contained vertices" do
      expect(array_compare(@goodface2.vertices, [@a, @e, @c])).to eq(true)
      expect(array_compare(@goodface2.vertices, [@a, @b, @c])).to eq(false)

    end
    it "raises error if edges aren't cyclic" do
      expect {Face.new([@D, @A, @B])}.to raise_error("Not cyclic edges")
    end
  end

  describe "#add_neighbor" do
    it "adds a neighbor" do
      @goodface1.add_neighbor(@goodface2)
      vert_share = @goodface1.neighboring_faces[0]["shared_vertices"]
      expect(array_compare(vert_share, [@a, @c])).to eq(true)
    end
    it "raises error if no elements are shared" do
      expect {@goodface1.add_neighbor(@disface)}.to raise_error("No connecting edges or vertices")
    end
  end

  describe "#remove_neighbor" do
    it "removes a neighbor (only one way)" do
      @goodface1.add_neighbor(@goodface2)
      @goodface1.remove_neighbor(@goodface2)
      expect(@goodface1.neighboring_faces.length).to eq(0)
    end

    it "returns error if they aren't neighbors" do
      expect {@goodface1.remove_neighbor(@disface)}.to raise_error("Not a neighbor")
    end
  end

end
