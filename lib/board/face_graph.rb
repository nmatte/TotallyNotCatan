require_relative 'face.rb'
require_relative 'graph.rb'

class FaceGraph < Graph
  attr_reader :faces

  def initialize
    #@faces is ALL faces on the graph
    @faces = []
    super
  end

  def add_face(edges_array)
    face = Face.new(edges_array)
    @faces << face
    face
  end

  def make_neighbors(face1, face2)
    face1.add_neighbor(face2)
    face2.add_neighbor(face1)
  end

  def remove_neighbors(face1, face2)
    face2.remove_neighbor(face1)
    face1.remove_neighbor(face2)
  end
end
