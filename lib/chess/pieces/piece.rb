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

    def do_move(row, column)
      unless moved?
        @moved = true
        @history_x = []; @history_y = []
      end
      move_to(row, column)
    end

    def undo_move
      raise "Already in initial position" if no_history
      @pos_x = @history_x.pop
      @pos_y = @history_y.pop
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

    private

    # pushes the old position to history first and then updates the curernt pos.
    def move_to(row, column)
      @history_x.push(@pos_x)
      @history_y.push(@pos_y)
      @pos_x = row
      @pos_y = column
    end

    def no_history
      @history_x.nil? || @history_x.empty?
    end
  end
end
