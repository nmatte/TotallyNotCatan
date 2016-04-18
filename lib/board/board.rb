require_relative 'road.rb'
require_relative 'spot.rb'
require_relative 'tile.rb'


# How do I show the resource of a face?

class Board < Zadt::FaceGraph
  attr_reader :board
  # Current board limitations (Other than the "capability_check")
    # It'll only make a board with consistently shaped tiles
  def initialize
    tile_shape = 6
    num_tiles = 19
    capability_check(tile_shape, num_tiles)
    @tile_shape = tile_shape
    @num_tiles = num_tiles
    super
    build_board
  end

  private

  def build_board
    build_first_tile
    build_second_tile
    build_tiles_3456
    build_seventh_tile
    build_eighth_tile
    build_9_through_18
    build_nineteenth_tile
  end

  def build_first_tile
    make_original_face(@tile_shape)
  end

  def build_second_tile
    # This second tile will share two vertices with the center one
    use_these_vertices = [vertices[1], vertices[0]]
    add_attached_face(use_these_vertices, @tile_shape)
  end

  def build_tiles_3456
    # Tiles 3456 will share two vertices with the center one,
    center_tile_vertex_id = 1
    other_center_tile_vertex_id = 2
    # and will also share two vertices with the one built before it.
      # One of these is center_tile_vertex_id, other is the last vertex built
        # vertices.last
    (@tile_shape - 2).times do |i|
      add_attached_face(
        [
          vertices[other_center_tile_vertex_id],
          vertices[center_tile_vertex_id],
          vertices.last
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
      vertices[@tile_shape],
      vertices.first,
      vertices[@tile_shape - 1],
      vertices.last
    ]
    add_attached_face(use_these_vertices, @tile_shape)
  end

  def build_eighth_tile
    use_these_vertices = [
      vertices[@tile_shape + 1],
      vertices[@tile_shape],
      vertices.last
    ]
    add_attached_face(use_these_vertices, @tile_shape)
  end

  def build_9_through_18
    # 10 times
    # TODO: Check to see if this is dynamic with other shapes
    (@tile_shape*2 - 2).times do |i|
      if i % 2 == 0
        use_these_vertices = [
          vertices[@tile_shape + 3*i/2 + 2],
          vertices[@tile_shape + 3*i/2 + 1],
          vertices.last
        ]
      else
        use_these_vertices = [
          vertices[@tile_shape + 3*(i-1)/2 + 4],
          vertices[@tile_shape + 3*(i-1)/2 + 3],
          vertices[@tile_shape + 3*(i-1)/2 + 2],
          vertices.last
        ]
      end
      add_attached_face(use_these_vertices, @tile_shape)
    end
  end

  def build_nineteenth_tile
    use_these_vertices = [
      vertices[@tile_shape * 4],
      vertices[@tile_shape * 4 - 1],
      vertices[@tile_shape * 4 - 2],
      vertices.last
    ]
    add_attached_face(use_these_vertices, @tile_shape)
  end

  def capability_check(tile_shape, num_tiles)
    raise "I don't know how to do that" unless tile_shape == 6 && num_tiles == 19
  end

end
