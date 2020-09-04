require_relative '../board.rb'
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

    # Returns valid piece moves. It checks by the rules of the each piece,
      # so it only checks a valid 'piece' movement, doesnt care if the piece is pinned
      # or king is already in check etc.
    def get_possible_moves(board)
      raise "This is an invalid piece so it hasn't got any possible moves"
    end

    def same_color_with?(other_piece)
      raise "Not a piece" unless other_piece.is_a?(Piece)
      @color == other_piece.color
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
