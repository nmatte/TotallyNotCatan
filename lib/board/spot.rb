require_relative 'vertex.rb'
class Spot < Vertex
  def initialize
    @occupied = false
    @color = "none"
    @level = 0
    super
  end
end
