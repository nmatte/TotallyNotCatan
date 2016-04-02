class Graph
  attr_reader :vertices, :edges
  def initialize(init_v = [])
    @vertices = init_v
    @edges = []
  end

  # Add a vertex
  def add_vertex
    v = Vertex.new
    @vertices << v
    v
  end

  # Make an edge between two vertices
  def make_connection(v1, v2)
    @edges << v1.connect(v2)
  end
end

def make_sample
  a = Vertex.new
  b = Vertex.new
  c = Vertex.new
  d = Vertex.new
  e = Vertex.new
  f = Vertex.new
  g = Vertex.new
  gr = Graph.new([a,b,c,d,e,f,g])
  gr.make_connection(a,b)
  gr.make_connection(a,c)
  gr.make_connection(c,d)
  gr.make_connection(e,f)
  gr
end

class Vertex
  attr_reader :edges, :connections
  def initialize
    # List of edges attached to vertex
    @edges = []
    # List of vertices "connected" to this one
    @connections = []
  end

  # Make an edge between this vertex and another
  # TODO:Check if connection's already there, vertex validity
  def connect(other_vertex)
    @connections << other_vertex
    edge = Edge.new(self, other_vertex)
    @edges << edge
    edge
  end
end

class Edge
  attr_reader :connection
  def initialize(v1, v2)
    @connection = [v1, v2]
  end
end
