require_relative 'face.rb'

class Tile < Face
  def initialize(surrounding_roads, resource = "grass", neighboring_faces = {})
    @resource = resource
    super(surrounding_roads, neighboring_faces)
  end
end
