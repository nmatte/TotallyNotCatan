require_relative 'edge.rb'

class Vertex
  attr_accessor :edges, :connections
  def initialize
    # List of edges attached to vertex
    @edges = []
    # List of vertices "connected" to this one
    @connections = []
  end

  # Make an edge between this vertex and another
  def connect(other_vertex)
    return nil if !other_vertex
    raise "already connected" if is_connected?(other_vertex)

    @connections << other_vertex
    edge = Edge.new(self, other_vertex)
    @edges << edge
    other_vertex.second_connect(self, edge)
    edge
  end

  def is_connected?(other_vertex)
    @connections.include?(other_vertex)
  end

  def second_connect(other_vertex, edge)
    @edges << edge
    @connections << other_vertex
  end
end
