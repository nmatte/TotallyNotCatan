class Spot < Zadt::Vertex
  def initialize
    @occupied = false
    @color = "none"
    @level = 0
    super
  end
end
