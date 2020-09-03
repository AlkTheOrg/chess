require_relative './piece.rb'
require 'pry'
module Chess
  class Pawn < Piece
    def initialize(position, color = 'white')
      super(position, color)
      @value = 1 # knight and bishop have the same relative value = 3
    end

    def init_unicode_value
      @unicode_value = color == 'white' ? "\u2659" : "\u265F"
    end
  end
end
