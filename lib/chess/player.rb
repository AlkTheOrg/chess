# Dir['./pieces/*.rb'].each { |file| require file }
module Chess
  class Player
    attr_reader :name, :color, :king, :pieces
    def initialize(name, color, pieces = [])
      @name = name
      @color = color
      @pieces = pieces
      set_king
    end

    private

    def set_king
      @king = pieces.find { |piece| piece.is_a?(King) }
      @pieces.delete(@king)
    end
  end
end
