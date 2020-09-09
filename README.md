# Chess

This is a basic Chess game that is played in the terminal.

## Pre-Project Thoughts
As I'm already familiar with the rules of chess, It is going to save a lot of time, but there are some question marks that I should think about such as;
- How and where should I implement `possible_moves_pieceType` kind of methods.
- I only started implementing `Piece` classes and added a method `moved?` which returns false it the piece hasn't moved since the beginning of the game so it should be easy to check castling.
- Implementing `king_in_check?` doesn't sound hard, but I'm not sure about the `piece_pinned?` kind of situations.
- I thought about using a 10x10 board to allign board output better, but I decided that using a 8x8 board should be more trivial.
- I will also make a basic AI at the end.


## Installation
Clone the repo and then
```sh
$ cd path/to/chess
$ ruby example/open_game.rb 
```
Or just use `menu.rb` to launch main menu with any method you want (irb, pry etc.)

## Usage
Read After-Project Thoughts first before using as I hadn't implemented all of the chess features.
- Load game (there are 2 games that I saved for you: white_to_mate_in_one, white_to_stalemate) or start a new game
- Choose a square until it has a piece that belongs to the current player and has legal moves. Game will ask you again until it is a valid square.
- Game will print you the legal moves of that piece. Choose one of them.
- Repeat until game is over or you want to stop playing.
- In main menu you can save your game or load game and then play/quit.

### Mate
![mate_1](/pngs/mate_1.png)

![mate_2](/pngs/mate_2.png)

![mate_3](/pngs/mate_3.png)

![mate_4](/pngs/mate_4.png)

### Stalemate
![stalemate_1](/pngs/stalemate_1.png)

![stalemate_2](/pngs/stalemate_2.png)

![stalemate_3](/pngs/stalemate_3.png)

#### Legality Checks
![legalities](/pngs/legalities.png)

## Development and After-Project Thoughts

- So the game was much smaller than I expected and logic behind methods were easy, but letting the only serious question (how and where to implement `possible_moves_pieceType`, `legal_moves_of(Piece)` kind of methods) unanswered left me with a bad design. 
- TDD was going great at first, but then not being sure about the design made me focus on just implementation and then coupling and more bugs came in.
- As you can see above, it works fine, but I'm not happy about the fact that some classes are coupled to each other. 
- I hadn't implemented `castling`, `en-passant`, `draw?`, `Simple_AI`. Because I will do it with a better design in the future and hopefully with a GUI.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
