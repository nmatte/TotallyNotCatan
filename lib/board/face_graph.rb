require_relative 'vertex.rb'
require_relative 'face.rb'

class FaceGraph
  attr_reader :vertices, :edges

  #init_v allows for initial vertices (not generally used)
  def initialize(init_v = [])
    #@vertices is ALL vertices on the graph
    @vertices = init_v
    #@edges is ALL edges on the graph
    @edges = []
    #@faces is ALL faces on the graph
    @faces = []
  end

  def add_face(edges_array)
    face = Face.new(edges_array)
    @faces << face
  end

  def make_neighbors(face1, face2)
    face1.add_neighbor(face2)
    face2.add_neighbor(face1)
  end

  def remove_neighbors(face1, face2)
    face2.remove_neighbor(face1)
    face1.remove_neighbor(face2)
  end

  # Add a vertex
  def add_vertex
    vertex = Vertex.new
    @vertices << vertex
    vertex
  end

  # Remove a vertex
  def remove_vertex(vertex)
    # The vertex must exist
    if !vertex
      raise "Vertex does not exist"
    # The vertex must not be connected to anything
    elsif !vertex.connections.empty?
      raise "Vertex has edges.  Break them first."
    # If it exists and isn't connected, delete it
    else
      @vertices.delete(vertex)
    end
  end

  # Make an edge between two vertices
  def make_connection(v1, v2)
    raise "already connected" if is_connected?(v1, v2)
    # Connect the two using the vertex method "connect"
    edge = v1.connect(v2)
    # Add to edge catalog
    @edges << edge
    edge
  end

  def break_connection(v1, v2)
    raise "First vertex does not exist" if !v1
    raise "Second vertex does not exist" if !v2

    if is_connected?(v1, v2)
      # Find edge
      edge = find_connection(v1, v2)
      # Remove edge from edges catalog
      @edges.delete(edge)
      #Remove edge from vertices
      v1.edges.delete(edge)
      v2.edges.delete(edge)
      v1.connections.delete(v2)
      v2.connections.delete(v1)
    else
      raise "Vertices are not connected"
    end
  end

  # Find the edge connecting two vertices
  def find_connection(v1, v2)
    connection = v1.edges.select {|edge| edge.connection.include?(v2)}
    connection.first
  end

  # Returns whether two vertices are connected
  def is_connected?(v1, v2)
    v1.connections.include?(v2)
  end
end
