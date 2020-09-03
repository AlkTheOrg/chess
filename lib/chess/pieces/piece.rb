module Chess
  class Piece
    attr_reader :pos_x, :pos_y, :color, :unicode_value, :value
    def initialize(position, color = 'white')
      @pos_x = position[0]
      @pos_y = position[1]
      @color = color
      init_unicode_value # unicode_value to represent in the terminal
      @moved = false
      @value = 0 # Undefined piece does not have a relative piece value.
    end

    def init_unicode_value
      @unicode_value = color == 'white' ? "\u263A" : "\u263B"
    end

    def do_move(row, col)
      @pos_x = row
      @pos_y = col
      @moved = true
    end

    def white?
      @color == 'white'
    end

    def moved?
      @moved
    end
    
    def to_s
      @unicode_value
    end
  end
end
