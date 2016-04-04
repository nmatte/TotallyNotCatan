require_relative 'vertex'
require_relative 'edge'

# Questions:
# TODO:Other than ensuring it's surrounded by consecutive edges, what does a face do?
#   Attach to another face?
# Help me make this ensure_cyclic less complicated.

class Face
  attr_reader :edges, :vertices
  def initialize(edges_array)
    raise "Not enough edges" if edges_array.length < 3
    @edges = edges_array
    @vertices = edges_array.inject(:+).uniq
    @vertices = ensure_cyclic
    @neighboring_faces = []
  end

  def add_neighbor(face)
    @neighboring_faces << face
  end

  def ensure_cyclic
    connect_testers = @vertices.dup
    connected_vertices = []
    connected_vertices << connect_testers.push
    until connected_vertices.length == @vertices.length
      continue = false
      connect_testers.each do |vert|
        if (connected_vertices.last).is_connected?(vert)
          connected_vertices << vert

          continue = true
          break
        end
      end
      connect_testers.delete(connected_vertices.last)
      raise "Not cyclic edges" if continue == false
    end
    connect
  end

end
