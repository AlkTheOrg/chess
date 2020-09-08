module Chess
  class Bishop < Piece
    def initialize(position, color = 'white')
      super(position, color)
      @value = 3 # knight and bishop have the same relative value = 3
    end

    def init_unicode_value
      @unicode_value = color == 'white' ? "\u2657" : "\u265D"
    end
  end
end
