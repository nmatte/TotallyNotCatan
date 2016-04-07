require_relative 'face_graph.rb'


# Should board use FaceGraph, or should
#   it just contain faces?
# How do I show the resource of a face?

class Board
  attr_reader :board
  # Current board limitations (Other than the "capability_check")
    # It'll only make a board with consistently shaped tiles
  def initialize(tile_shape = 6, num_tiles = 19)
    capability_check(tile_shape, num_tiles)
    @tile_shape = tile_shape
    @num_tiles = num_tiles
    @board = FaceGraph.new
    build_board
  end



  private

  def build_board
    build_first_tile
    build_second_tile
    build_tiles_3456
    build_seventh_tile
    # build_78910111213
  end

  def build_first_tile
    @board.make_original_face(@tile_shape)
  end

  def build_second_tile
    # This second tile will share two vertices with the center one
    use_these_vertices = [@board.vertices[0], @board.vertices[1]]
    @board.add_attached_face(use_these_vertices, @tile_shape)
  end

  def build_tiles_3456
    # Tiles 3456 will share two vertices with the center one,
    center_tile_vertex_id = 1
    other_center_tile_vertex_id = 2
    # and will also share two vertices with the one built before it.
      # One of these is center_tile_vertex_id, other is the last vertex built
        # @board.vertices.last
    (@tile_shape - 2).times do
      @board.add_attached_face(
        [
          @board.vertices.last,
          @board.vertices[center_tile_vertex_id],
          @board.vertices[other_center_tile_vertex_id]
        ],
        @tile_shape
      )
      center_tile_vertex_id += 1
      other_center_tile_vertex_id += 1
    end
  end

  def build_seventh_tile
    # Tile seven will connect tiles 2 and 6.
    # Just like the other outer tiles, it will share two vertices with the center tile
    #   as well as two with the tile just built.
    #   as well as two with tile #2
    # TODO: This last tile is not very dynamic, so be careful!
    use_these_vertices = [
      @board.vertices.last,
      @board.vertices[@tile_shape - 1],
      @board.vertices.first,
      @board.vertices[@tile_shape]
    ]
    @board.add_attached_face([use_these_vertices], @tile_shape)
  end

  # def build_78910111213
  #
  # end


  def capability_check(tile_shape, num_tiles)
    raise "I don't know how to do that" unless tile_shape == 6 && num_tiles == 19
  end

end
