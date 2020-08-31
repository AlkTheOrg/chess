require "chess/version"

module Chess
  class Error < StandardError; end
  # Your code goes here...
end

require_relative './lib/bishop.rb'
require_relative './lib/king.rb'
require_relative './lib/knight.rb'
require_relative './lib/pawn.rb'
require_relative './lib/piece.rb'
require_relative './lib/queen.rb'
require_relative './lib/rook.rb'
