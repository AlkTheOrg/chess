module Chess
  class Error < StandardError; end
  # Your code goes here...
end

require_relative './chess/pieces/piece.rb'
require_relative './chess/pieces/bishop.rb'
require_relative './chess/pieces/king.rb'
require_relative './chess/pieces/knight.rb'
require_relative './chess/pieces/pawn.rb'
require_relative './chess/pieces/queen.rb'
require_relative './chess/pieces/rook.rb'

require_relative './chess/board.rb'
require_relative './chess/player.rb'
require_relative './chess/game.rb'
require_relative './chess/menu.rb'

require 'pry'
require 'yaml'
require 'date'
