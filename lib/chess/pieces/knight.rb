require_relative './piece.rb'
require 'pry'
module Chess
  class Knight < Piece
    def initialize(position, color = 'white')
      super(position, color)
    end

    def update_possible_moves
      @possible_moves = possible_knight_moves
    end

    def init_value
      @value = color == 'white' ? "\u2658" : "\u265E"
    end

    private

    def possible_knight_moves
      moves = [[2, 1], [1, 2], [-1, 2], [-2, 1], 
                     [-2, -1], [-1, -2], [1, -2], [2, -1]]
      possible_moves = []
      moves.each { |move| calculate_possible_move(move, possible_moves) }
      possible_moves
    end

    def calculate_possible_move(move, possible_moves)
      x = @pos_x + move[0]
      y = @pos_y + move[1]
      possible_moves.push([].push(x).push(y))
    end
  end
end
