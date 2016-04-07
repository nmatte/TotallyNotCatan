require_relative 'edge.rb'
class Road < Edge
  attr_reader :road_color
  def initialize(spot1, spot2)
    @road_color = "blank"
    super(spot1, spot2)
  end

  def change_color(color)
    @road_color = color
  end
end
