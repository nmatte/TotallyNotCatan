require_relative 'vertex.rb'


class Graph
  attr_reader :vertices, :edges

  #init_v allows for initial vertices
  def initialize(init_v = [])
    #@vertices is ALL vertices on the graph
    @vertices = init_v
    #@edges is ALL edges on the graph
    @edges = []
  end

  # Add a vertex
  def add_vertex
    vertex = Vertex.new
    @vertices << vertex
    vertex
  end

  # Remove a vertex
  def remove_vertex(vertex)
    if !vertex
      raise "Vertex does not exist"
      # The vertex must not be connected to anything
    elsif !vertex.connections.empty?
      raise "Vertex has edges.  Break them first."
    else
      @vertices.delete(vertex)
    end
  end

  # Make an edge between two vertices
  def make_connection(v1, v2)
    raise "already connected" if is_connected?(v1, v2)
    edge = v1.connect(v2)
    @edges << edge
    edge
  end

  def break_connection(v1, v2)
    raise "First vertex does not exist" if !v1
    raise "Second vertex does not exist" if !v2

    if is_connected?(v1, v2)
      edge = find_connection(v1, v2)
      @edges.delete(edge)
      v1.edges.delete(edge)
      v2.edges.delete(edge)
      v1.connections.delete(v2)
      v2.connections.delete(v1)
    else
      raise "Vertices are not connected"
    end
  end

  def find_connection(v1, v2)
    connection = v1.edges.select {|edge| edge.connection.include?(v2)}
    connection.first
  end

  def is_connected?(v1, v2)
    v1.connections.include?(v2)
  end
end
