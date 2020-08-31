module Chess
  class Piece
    def initialize(position, name, color)
      @pos_x = position[0]
      @pox_y = position[1]
      @color = color
      name_piece(name)
    end

    def name_piece
      color == "white" ? @name = name.to_upper : @name = name.to_lower
    end

    def possible_moves; end

    def to_s

    end
    
  end
end
