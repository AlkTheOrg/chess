module Chess
  class Board
    attr_reader :kings, :pieces, :cells
    def initialize
      @pieces = []
      @history = [] # holds the pieces that moved from first to last so that
      # undoing from last to first can get revert the game
      set_board
    end

    def coordinates_out_of_bounds?(x, y)
      x < 0 || y < 0 || x > 7 || y > 7
    end

    def piece_at(x, y)
      @cells[x][y]
    end

    def move_piece_to(move, piece)
      cells[piece.pos_x][piece.pos_y] = nil # clear old position
      piece.do_move(move[0], move[1]) # move piece
      @history.push(piece) # push to history
      piece_taken = cells[move[0]][move[1]] # old value of the moved position
      kill_piece(piece_taken)
      cells[move[0]][move[1]] = piece # fill the new position
    end

    def undo_last_move
      piece = @history.pop
      # if last move is a deletion, revert the other move as well. otherwise, empty the cell
      piece.pos_x == -1 ? undo_last_move : cells[piece.pos_x][piece.pos_y] = nil
      piece.undo_move
      cells[piece.pos_x][piece.pos_y] = piece
    end

    # removes piece from board if it is a Piece
    def kill_piece(piece)
      unless piece.nil? # if piece exists
        @cells[piece.pos_x][piece.pos_y] = nil
        piece.do_move(-1, -1) # move piece out of board
        @history.push(piece) # push to history
      end
    end

    # returns set of coordinates that are nil, but
    # if there is any piece in that direction
    # it also pushes the one that was faced first
    # at that direction to the last index of the set
    def coordinates_from_to(x, y, to)
      case to
      when 'north west'
        north_west_from(x, y)
      when 'north east'
        north_east_from(x, y)
      when 'south west'
        south_west_from(x, y)
      when 'south east'
        south_east_from(x, y)
      when 'south'
        south_from(x, y)
      when 'north'
        north_from(x, y)
      when 'east'
        east_from(x, y)
      when 'west'
        west_from(x, y)
      end
    end

    def to_s
      7.downto(0) do |row|
        puts
        print "#{row + 1}   "
        (0..7).each do |column|
          piece = cells[row][column]
          piece.nil? ? (print "\u25A1" + '  ') : (print piece.unicode_value + '  ')
        end
      end
      puts "\n-   a  b  c  d  e  f  g  h"
      puts "\n\n"
    end

    private

    # creates pieces first and then puts them to 8x8 2 dim array
    def set_board
      @cells = Array.new(8) { Array.new(8, nil) }
      set_pieces
      put_pieces_to_cells
    end

    def set_pieces
      @cells = Array.new(8) { Array.new(8, nil) }
      set_pawns
      set_queens
      set_kings
      set_bishops
      set_rooks
      set_knights
    end

    def put_pieces_to_cells
      pieces.each { |piece| cells[piece.pos_x][piece.pos_y] = piece }
    end

    def set_kings
      @kings = [].push(King.new([0, 4])).push(King.new([7, 4], 'black'))
      @kings.each { |king| @pieces.push(king) }
    end

    def set_pawns
      (0..7).each { |i| pieces.push(Pawn.new([1, i])) } # white pawns
      (0..7).each { |i| pieces.push(Pawn.new([6, i], 'black')) } # black pawns
    end

    def set_queens
      pieces.push(Queen.new([0, 3])).push(Queen.new([7, 3], 'black'))
    end

    def set_bishops
      pieces.push(Bishop.new([0, 2])).push(Bishop.new([7, 2], 'black'))
            .push(Bishop.new([0, 5])).push(Bishop.new([7, 5], 'black'))
    end

    def set_rooks
      pieces.push(Rook.new([0, 0])).push(Rook.new([7, 0], 'black'))
            .push(Rook.new([0, 7])).push(Rook.new([7, 7], 'black'))
    end

    def set_knights
      pieces.push(Knight.new([0, 1])).push(Knight.new([7, 1], 'black'))
            .push(Knight.new([0, 6])).push(Knight.new([7, 6], 'black'))
    end

    # Each code below takes the (x, y) as the starting point and
    # until it reaches to a Piece or out of bounds on the given direction
    # it puts the coordinates to an array one by one and then returns it.
    # If it finds a piece it puts its coordinate as well and then breaks

    def north_west_from(x, y)
      coordinates = []
      x_next = x + 1
      y_next = y - 1
      until coordinates_out_of_bounds?(x_next, y_next)
        coordinates.push([].push(x_next).push(y_next))
        break unless @cells[x_next][y_next].nil?

        x_next += 1; y_next -= 1
      end
      coordinates
    end

    def north_east_from(x, y)
      coordinates = []
      x_next = x + 1
      y_next = y + 1
      until coordinates_out_of_bounds?(x_next, y_next)
        coordinates.push([].push(x_next).push(y_next))
        break unless @cells[x_next][y_next].nil?

        x_next += 1; y_next += 1
      end
      coordinates
    end

    def south_west_from(x, y)
      coordinates = []
      x_next = x - 1
      y_next = y - 1
      until coordinates_out_of_bounds?(x_next, y_next)
        coordinates.push([].push(x_next).push(y_next))
        break unless @cells[x_next][y_next].nil?

        x_next -= 1; y_next -= 1
      end
      coordinates
    end

    def south_east_from(x, y)
      coordinates = []
      x_next = x - 1
      y_next = y + 1
      until coordinates_out_of_bounds?(x_next, y_next)
        coordinates.push([].push(x_next).push(y_next))
        break unless @cells[x_next][y_next].nil?

        x_next -= 1; y_next += 1
      end
      coordinates
    end

    def north_from(x, y)
      coordinates = []
      x_next = x + 1
      until coordinates_out_of_bounds?(x_next, y)
        coordinates.push([].push(x_next).push(y))
        break unless @cells[x_next][y].nil?

        x_next += 1
      end
      coordinates
    end

    def south_from(x, y)
      coordinates = []
      x_next = x - 1
      until coordinates_out_of_bounds?(x_next, y)
        coordinates.push([].push(x_next).push(y))
        break unless @cells[x_next][y].nil?

        x_next -= 1
      end
      coordinates
    end

    def west_from(x, y)
      coordinates = []
      y_next = y - 1
      until coordinates_out_of_bounds?(x, y_next)
        coordinates.push([].push(x).push(y_next))
        break unless @cells[x][y_next].nil?

        y_next -= 1
      end
      coordinates
    end

    def east_from(x, y)
      coordinates = []
      y_next = y + 1
      until coordinates_out_of_bounds?(x, y_next)
        coordinates.push([].push(x).push(y_next))
        break unless @cells[x][y_next].nil?

        y_next += 1
      end
      coordinates
    end
  end
end
