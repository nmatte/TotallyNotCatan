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
    v1.connections[v2.id] == v2
  end
end

def make_sample
  gr = Graph.new
  a = gr.add_vertex
  b = gr.add_vertex
  c = gr.add_vertex
  d = gr.add_vertex
  e = gr.add_vertex
  f = gr.add_vertex
  g = gr.add_vertex
  gr.make_connection(a,b)
  gr.make_connection(a,c)
  gr.make_connection(c,d)
  gr.make_connection(e,f)
  gr
end

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
    return nil if is_connected?(other_vertex)

    @connections << other_vertex
    edge = Edge.new(self, other_vertex)
    @edges << edge
    edge
  end

  def is_connected?(other_vertex)
    @connections.include?(other_vertex)
  end
end

class Edge
  attr_accessor :connection
  def initialize(v1, v2)
    @connection = [v1, v2]
  end
end
