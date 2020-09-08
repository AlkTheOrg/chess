module Chess
  class Piece
    attr_reader :pos_x, :pos_y, :color, :unicode_value, :value, :position
    def initialize(position, color = 'white')
      @position = position
      @pos_x = position[0]
      @pos_y = position[1]
      @color = color
      init_unicode_value # unicode_value to represent in the terminal
      @moved = false
      @value = 0 # Undefined piece does not have a relative piece value.
    end

    # possible_moves methods are special to each Piece type and they
    # return the 'valid Piece moves' which means they dont care if they
    # are pinned or king in check / checkmated / stalemated etc.
    # They just take a piece and a board and look for 'valid Piece moves'.
    def self.possible_moves(piece, board)
      x = piece.pos_x
      y = piece.pos_y
      piece_color = piece.color
      moved = piece.moved?
      possible_moves_by_info(piece, x, y, piece_color, moved, board)
    end

    def self.possible_moves_by_info(piece, x, y, color, moved, board)
      case piece
      when King
        possible_king_moves(x, y, color, board)
      when Queen
        possible_queen_moves(x, y, color, board)
      when Rook
        possible_rook_moves(x, y, color, board)
      when Knight
        possible_knight_moves(x, y, color, board)
      when Bishop
        possible_bishop_moves(x, y, color, board)
      when Pawn
        possible_pawn_moves(x, y, color, moved, board)
      else
        raise 'Invalid piece'
      end
    end

    def init_unicode_value
      @unicode_value = color == 'white' ? "\u263A" : "\u263B"
    end

    def do_move(row, column)
      unless moved?
        @moved = true
        @history_x = []; @history_y = []
      end
      move_to(row, column)
    end

    def undo_move
      raise 'Already in initial position' if no_history

      @pos_x = @history_x.pop
      @pos_y = @history_y.pop
      @position[0] = @pos_x; @position[1] = @pos_y
      @moved = false if @history_x.empty?
    end

    def white?
      @color == 'white'
    end

    def color_is?(color)
      @color == color
    end

    def moved?
      @moved
    end

    def to_s
      @unicode_value
    end

    def death?
      @position == [-1, -1]
    end

    private

    def move_to(row, column)
      @history_x.push(@pos_x)
      @history_y.push(@pos_y)
      @pos_x = row
      @pos_y = column
      @position[0] = row; @position[1] = column
    end

    def no_history
      @history_x.nil? || @history_x.empty?
    end

    def self.possible_queen_moves(x, y, color, board)
      possible_bishop_moves(x, y, color, board) +
        possible_rook_moves(x, y, color, board)
    end

    def self.possible_king_moves(x, y, color, board)
      moves = [[1, -1], [1, 0], [1, 1], [0, 1],
               [-1, 1], [-1, 0], [-1, -1], [0, -1]]
      possible_moves = []
      moves.each do |move|
        if_king_move_possible_add_to(
          possible_moves, x + move[0], y + move[1], board, color, moves
        )
      end
      possible_moves
    end

    def self.if_king_move_possible_add_to(possible_moves, x, y, board, color, moves)
      return if board.coordinates_out_of_bounds?(x, y)

      piece = board.piece_at(x, y)
      if (piece.nil? || (piece.is_a?(Piece) && !piece.color_is?(color))) && no_king_neighbour?(x, y, board, moves, color)
        possible_moves.push([].push(x).push(y))
      end
    end

    def self.no_king_neighbour?(x, y, board, moves, color)
      moves.each do |move|
        piece = board.piece_at(x + move[0], y + move[1])
        return false if piece.is_a?(King) && !piece.color_is?(color)
      end
      true
    end

    def self.possible_pawn_moves(x, y, color, moved, board)
      if color == 'white'
        possible_white_pawn_moves(x, y, color, moved, board)
      else
        possible_black_pawn_moves(x, y, color, moved, board)
      end
    end

    def self.possible_white_pawn_moves(x, y, color, moved, board)
      straight = [[1, 0]]
      straight.push([2, 0]) unless moved
      cross = [[1, -1], [1, 1]]
      check_straight_pawn_moves(straight, x, y, board) +
        check_cross_pawn_moves(cross, x, y, color, board)
    end

    def self.possible_black_pawn_moves(x, y, color, moved, board)
      straight = [[-1, 0]]
      straight.push([-2, 0]) unless moved
      cross = [[-1, -1], [-1, 1]]
      check_straight_pawn_moves(straight, x, y, board) +
        check_cross_pawn_moves(cross, x, y, color, board)
    end

    def self.check_straight_pawn_moves(straight, x, y, board)
      moves = []
      straight.map { |move| move[0] += x; move[1] += y }
      piece = board.piece_at(straight[0][0], straight[0][1])
      if piece.nil?
        moves.push(straight[0])
        moves.push(straight[1]) if straight.size == 2 && board.piece_at(straight[1][0], straight[1][1]).nil?
      end
      moves
    end

    def self.check_cross_pawn_moves(cross, x, y, color, board)
      moves = []
      cross.map { |move| move[0] += x; move[1] += y }
      cross.each do |move|
        piece = board.piece_at(move[0], move[1])
        moves.push([].push(move[0]).push(move[1])) if piece.is_a?(Piece) && !piece.color_is?(color)
      end
      moves
    end

    def self.possible_knight_moves(x, y, color, board)
      moves = [[2, 1], [1, 2], [-1, 2], [-2, 1],
               [-2, -1], [-1, -2], [1, -2], [2, -1]]
      possible_moves = []
      moves.each do |move|
        if_knight_move_possible_add_to(
          possible_moves, x + move[0], y + move[1], board, color
        )
      end
      possible_moves
    end

    def self.if_knight_move_possible_add_to(possible_moves, x, y, board, color)
      return if board.coordinates_out_of_bounds?(x, y)

      piece = board.piece_at(x, y)
      possible_moves.push([].push(x).push(y)) if piece.nil? || (piece.is_a?(Piece) && !piece.color_is?(color))
    end

    def self.possible_bishop_moves(x, y, color, board)
      all_routes = []
      all_routes.push(board.coordinates_from_to(x, y, 'north west'))
                .push(board.coordinates_from_to(x, y, 'south west'))
                .push(board.coordinates_from_to(x, y, 'north east'))
                .push(board.coordinates_from_to(x, y, 'south east'))
      all_routes.each { |route| check_last_route_coordinate(route, color, board) }
      all_routes.flatten(1)
    end

    def self.possible_rook_moves(x, y, color, board)
      all_routes = []
      all_routes.push(board.coordinates_from_to(x, y, 'north'))
                .push(board.coordinates_from_to(x, y, 'south'))
                .push(board.coordinates_from_to(x, y, 'west'))
                .push(board.coordinates_from_to(x, y, 'east'))
      all_routes.each { |route| check_last_route_coordinate(route, color, board) }
      all_routes.flatten(1)
    end

    def self.check_last_route_coordinate(route, color, board)
      return if route.empty?

      last_coord = route[-1]
      x = last_coord[0]
      y = last_coord[1]
      piece = board.piece_at(x, y)
      route.pop if piece.is_a?(Piece) && piece.color_is?(color)
    end
  end
end
