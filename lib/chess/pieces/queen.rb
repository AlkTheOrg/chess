module Chess
  class Queen < Piece
    def initialize(position, color = 'white')
      super(position, color)
      @value = 9 # knight and bishop have the same relative value = 3
    end

    def init_unicode_value
      @unicode_value = color == 'white' ? "\u2655" : "\u265B"
    end
  end
end
