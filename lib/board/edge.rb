class Edge
  attr_accessor :connection
  def initialize(v1, v2)
    @connection = [v1, v2]
  end
end
