module Chess
  class Piece
    attr_reader :pos_x, :pos_y, :color, :possible_moves
    def initialize(position, color = 'white')
      @pos_x = position[0]
      @pox_y = position[1]
      @color = color
      update_possible_moves
      color == 'white' ? @value = "\u263A" : @value = "\u263B"
    end

    def update_possible_moves
      @possible_moves = []
    end

    def update_position(position)
      @pos_x = position[0]
      @pos_y = position[1]
      update_possible_moves
    end

    def white?
      @color == 'white'
    end

    def to_s
      @value
    end
    
  end
end
