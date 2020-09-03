require_relative './piece.rb'
require 'pry'
module Chess
  class Rook < Piece
    def initialize(position, color = 'white')
      super(position, color)
      @value = 5 # knight and bishop have the same relative value = 3
    end

    def init_unicode_value
      @unicode_value = color == 'white' ? "\u2656" : "\u265C"
    end
  end
end
