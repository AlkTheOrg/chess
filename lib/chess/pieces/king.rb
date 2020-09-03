require_relative './piece.rb'
require 'pry'
module Chess
  class King < Piece
    def initialize(position, color = 'white')
      super(position, color)
      @value = 50 # knight and bishop have the same relative value = 3
    end

    def init_unicode_value
      @unicode_value = color == 'white' ? "\u2654" : "\u265A"
    end
  end
end
