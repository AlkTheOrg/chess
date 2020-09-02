# Chess

This is a basic Chess game that is played in the terminal.

## Pre-Project Thoughts
As I'm already familiar with the rules of chess, It is going to save a lot of time, but there are some question marks that I should think about such as;
- How and where should I implement the methods of `possible_moves_pieceType` kind of methods.
- I only started implementing `Piece` classes and added a method `moved?` which returns false it the piece hasn't moved since the beginning of the game so it should be easy to check `en_passant` and `castle` kind of methods.
- Implementing `king_in_check?` doesn't sound hard, but I'm not sure about the `king_forked?` situations.
- I thought about using a 10x10 board to allign board output better, but I decided that using a 8x8 board should be more trivial.
- I also will do a basic AI at the end. It'll be a DFS of course, probably in depth of 20, but I'm not sure about how the score of the board should be updated and after that how should the computer decide which move to play. Only thing that I know at the moment is that, [relative piece values](https://en.wikipedia.org/wiki/Chess_piece_relative_value) will be used, but no idea about how to decide the strength and rate the current position of the game. Will think about these at the end, but I'm not trying to make stockfish on my own anyways.


## Installation
```sh
$ cd to_location_where_you_want_this_project_folder_to_be
$ git clone https://github.com/AlkTheOrg/chess
```

## Usage

TODO: Write usage instructions here

## Development

TODO

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/AlkTheOrg/chess. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/AlkTheOrg/chess/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
