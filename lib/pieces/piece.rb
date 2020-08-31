module Chess
  attr_reader :position, :name, :color, :possible_moves
  class Piece
    def initialize(position, name, color)
      @pos_x = position[0]
      @pox_y = position[1]
      @color = color
      name_piece(name)
      update_possible_moves
    end

    def name_piece(name)
      color == "white" ? @name = name.to_upper : @name = name.to_lower
    end

    def update_possible_moves
      @possible_moves = []
    end

    def update_position(position)
      @pos_x = position[0]
      @pos_y = position[1]
      update_possible_moves
    end

    def to_s
      name
    end
    
  end
end
