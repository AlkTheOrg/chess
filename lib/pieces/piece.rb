module Chess
  class Piece
    def initialize(position, name, color)
      @pos_x = position[0]
      @pox_y = position[1]
      @name = name
      @color = color
    end

    def possible_moves; end

    def to_s

    end
    
  end
end
