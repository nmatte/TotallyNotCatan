require_relative 'face.rb'

class Tile
  def initialize(surrounding_roads, neighboring_faces = {})
    @tile = Face.new(surrounding_roads)
  end
end
