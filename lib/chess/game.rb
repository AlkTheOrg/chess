module Chess
  class Game
    attr_reader :board, :other_player, :current_player
    def initialize
      @board = Board.new
      set_players
    end

    def play
      loop do
        return if game_over?

        @board.to_s
        puts ''
        puts solicit_move
        piece = get_piece_to_move
        return if piece == 'stop'
        piece = get_piece_to_move until valid_piece?(piece) && make_move(piece)
        switch_players
      end
    end

    private

    def set_players
      white_pieces = @board.pieces.select { |piece| piece.white? }
      @current_player = Player.new('White Player', 'white', white_pieces)
      black_pieces = @board.pieces.select { |piece| !piece.white? }
      @other_player = Player.new('Black Player', 'black', black_pieces)
    end

    def switch_players
      @current_player, @other_player = @other_player, @current_player
    end

    def solicit_move
      puts "#{@current_player.name}: Type 'stop' to quit current game."
      print "\nEnter the square info that you want to move piece from: "
    end

    # Input example: "b3"
    def get_piece_to_move(input = gets.chomp)
      return input if input == 'stop'
      input_arr = input.split('')
      column = input_arr[0].ord - 97
      row = input_arr[1].to_i - 1
      @board.piece_at(row, column)
    end

    def valid_piece?(piece)
      result = false
      if !piece.is_a?(Piece)
        puts 'Not a piece'
      elsif !piece.color_is?(@current_player.color)
        puts "Not a #{@current_player.color} piece"
      else
        true
      end
    end

    def make_move(piece)
      legal_moves = legal_moves_of(piece)
      if legal_moves.empty?
        puts 'No legal moves of this piece'
        false
      else
        legal_moves.each_with_index { |move, i| puts "#{i}: #{(move[1] + 97).chr}#{move[0] + 1}" }
        print 'Enter your move choise: '
        input = gets.chomp
        input = gets.chomp until (input =~ /\A[±]?\d+\z/) == 0 &&
                                 input.to_i >= 0 && input.to_i < legal_moves.size
        @board.move_piece_to(legal_moves[input.to_i], piece)
        true
      end
    end

    def game_over?
      if checkmated?
        puts "#{@other_player.name} won!"
        @board.to_s
        true
      elsif stalemated?
        puts 'Stalemated'
        @board.to_s
        true
      else
        false
      end
    end

    def checkmated?
      king_in_check? && !check_avoidable?
    end

    def check_avoidable?
      pieces = @current_player.pieces
      pieces.each do |piece|
        legal_moves = legal_moves_of(piece)
        return true if legal_moves.any? { |move| move_avoids_check?(move, piece) }
      end
      false
    end

    def stalemated?
      !king_in_check? && no_possible_moves?
    end

    def no_possible_moves?
      @current_player.pieces.all? { |piece| legal_moves_of(piece).empty? }
    end

    def king_in_check?
      enemy_pieces = @other_player.pieces
      king_position = @current_player.king.position
      enemy_pieces.any? { |piece| !piece.death? && Piece.possible_moves(piece, @board).include?(king_position) }
    end

    def legal_moves_of(piece)
      return [] if piece.death?
      possible_moves = Piece.possible_moves(piece, @board)
      possible_moves.select! { |move| move_avoids_check?(move, piece) }
      possible_moves
    end

    def move_avoids_check?(move, piece)
      @board.move_piece_to(move, piece)
      result = !king_in_check?
      @board.undo_last_move
      result
    end
  end
end
