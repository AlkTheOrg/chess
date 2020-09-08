module Chess
  class Knight < Piece
    def initialize(position, color = 'white')
      super(position, color)
      @value = 3 # knight and bishop have the same relative value = 3
    end

    def init_unicode_value
      @unicode_value = color == 'white' ? "\u2658" : "\u265E"
    end
  end
end
