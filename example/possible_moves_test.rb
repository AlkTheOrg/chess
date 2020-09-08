require_relative '../lib/chess.rb'
module Chess
  menu = Menu.new
  game = menu.game
  board = game.board
  # white to mate in one
  board.move_piece_to([3, 4], board.piece_at(1, 4))
  board.move_piece_to([4, 4], board.piece_at(6, 4))
  board.move_piece_to([4, 7], board.piece_at(0, 3))
  board.move_piece_to([5, 2], board.piece_at(7, 1))
  board.move_piece_to([3, 2], board.piece_at(0, 5))
  board.move_piece_to([4, 0], board.piece_at(6 , 0))

  # stalemate
  # board.move_piece_to([2, 4], board.piece_at(1, 4))
  # board.move_piece_to([4, 0], board.piece_at(6, 0))
  # board.move_piece_to([4, 7], board.piece_at(0, 3))
  # board.move_piece_to([5, 0], board.piece_at(7, 0))
  # board.move_piece_to([4, 0], board.piece_at(4, 7))
  # board.move_piece_to([4, 7], board.piece_at(6, 7))
  # board.move_piece_to([3, 7], board.piece_at(1, 7))
  # board.move_piece_to([5, 7], board.piece_at(5, 0))

  # board.move_piece_to([6, 2], board.piece_at(4, 0))
  # board.move_piece_to([5, 5], board.piece_at(6, 5))
  # board.move_piece_to([6, 3], board.piece_at(6, 2))
  # board.move_piece_to([6, 5], board.piece_at(7, 4))
  # board.move_piece_to([6, 1], board.piece_at(6, 3))
  # board.move_piece_to([2, 3], board.piece_at(7, 3))
  # board.move_piece_to([7, 1], board.piece_at(6, 1))
  # board.move_piece_to([6, 7], board.piece_at(2, 3))
  # board.move_piece_to([7, 2], board.piece_at(7, 1))
  # board.move_piece_to([5, 6], board.piece_at(6, 5))
  binding.pry
  # board.move_piece_to([5, 4], board.piece_at(7, 2))


  game.play

  # binding.pry
end
