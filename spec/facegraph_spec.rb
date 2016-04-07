require_relative 'spec_helper.rb'

describe FaceGraph do
  before :each do
    @facegraph = FaceGraph.new
    @a = @facegraph.add_vertex
    @b = @facegraph.add_vertex
    @c = @facegraph.add_vertex
    @d = @facegraph.add_vertex
    @e = @facegraph.add_vertex
    @f = @facegraph.add_vertex
    @A = @facegraph.make_connection(@a, @b)
    @B = @facegraph.make_connection(@b, @c)
    @C = @facegraph.make_connection(@c, @a)

    @D = @facegraph.make_connection(@d, @b)

    @goodface1 = @facegraph.add_face([@B, @A, @C])
    @E = @facegraph.make_connection(@e, @a)
    @F = @facegraph.make_connection(@c, @e)
    @goodface2 = @facegraph.add_face([@C, @E, @F])

    # Disconnected face
    @x = @facegraph.add_vertex
    @y = @facegraph.add_vertex
    @z = @facegraph.add_vertex
    @X = @facegraph.make_connection(@x, @y)
    @Y = @facegraph.make_connection(@y, @z)
    @Z = @facegraph.make_connection(@x, @z)
    @disface = @facegraph.add_face([@X, @Y, @Z])
  end
  describe "#add_face" do
    it "makes a face with the given edges" do
      expect(array_compare(@goodface1.edges, [@A, @B, @C])).to eq(true)
      expect(array_compare(@goodface2.edges, [@E, @C, @F])).to eq(true)
    end
    it "contains the vertices of the edges" do
      expect(array_compare(@goodface1.vertices, [@a, @b, @c])).to eq(true)
      expect(array_compare(@goodface2.vertices, [@e, @c, @a])).to eq(true)
    end
  end
  describe "#add_face" do
    it "makes a face with the given edges" do
      expect(array_compare(@goodface1.edges, [@A, @B, @C])).to eq(true)
      expect(array_compare(@goodface2.edges, [@E, @C, @F])).to eq(true)
    end
    it "contains the vertices of the edges" do
      expect(array_compare(@goodface1.vertices, [@a, @b, @c])).to eq(true)
      expect(array_compare(@goodface2.vertices, [@e, @c, @a])).to eq(true)
    end
  end
  describe "#make_original_face" do
    it "makes a face" do
      orig_face = @facegraph.make_original_face(4)
      expect(orig_face.vertices.length).to eq(4)
      expect(orig_face.edges.length).to eq(4)
    end
    it "makes a disconnected face" do
      orig_face = @facegraph.make_original_face(4)
      disconnected = true
      orig_face.vertices.each do |vertex|
        disconnected = false if vertex.is_connected?(@a)
      end
      expect(disconnected).to eq(true)
    end
  end
  describe "#add_attached_face" do
    it "makes an attached face" do
      face = @facegraph.add_attached_face([@a, @b], 4)
      expect(face.vertices.length).to eq(4)
      expect(face.edges.length).to eq(4)
    end
    it "includes all neighbors" do
      face = @facegraph.add_attached_face([@a, @b], 4)
      neighbors = []
      face.neighboring_faces.each do |id, neighbor_info|
        neighbors << neighbor_info["face"]
      end
      expect(neighbors.include?(@goodface1)).to eq(true)
      expect(neighbors.include?(@goodface2)).to eq(true)
    end
    # TODO: Finish this spec
    it "adds the new face as a neighbor to its neighbors" do
      face = @facegraph.add_attached_face([@a, @b], 4)
      neighbors = []
      @goodface1.neighboring_faces.each do |id, neighbor_info|
        neighbors << neighbor_info["face"]
      end
      expect(neighbors.include?(face)).to eq(true)
    end
  end
end
