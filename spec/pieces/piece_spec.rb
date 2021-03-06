require_relative '../spec_helper.rb'

module Chess
  describe Piece do
    context "#initialize" do
      it "initializes a piece with position and name" do
        expect { Piece.new([0, 0]) }.to_not raise_error
      end

      it "takes an optional color parameter" do
        expect { Piece.new([0, 0], 'red') }.to_not raise_error
      end
    end

    context "#attr_readers" do
      it "returns the value of its pos_x, pos_y, name and color" do
        piece = Piece.new([0, 0], 'black')
        expect(piece.pos_x).to eql 0
        expect(piece.pos_y).to eql 0
        expect(piece.unicode_value).to eql "\u263B"
        expect(piece.color).to eql 'black'
        expect(piece.value).to eql 0
      end
    end

    # context "#update_possible_moves" do
    #   it "sets the possible move array empty as piece itself is an unknown piece" do
    #     piece = Piece.new([0, 0])
    #     expect(piece.possible_moves).to eql []
    #   end
    # end

    context "#do_move" do
      it "updates the x and y values of the piece" do
        piece = Piece.new([0, 0])
        piece.do_move(5, 3)
        expect(piece.pos_x).to eql 5
        expect(piece.pos_y).to eql 3
      end
    end

    context "#undo_move" do
      it "raises an error if the piece hadn't moved before" do
        piece = Piece.new([0, 0])
        expect { piece.undo_move }.to raise_error
      end

      it "turns the piece back to the position before if it moved at least once" do
        piece = Piece.new([0, 6])
        piece.do_move(5, 3)
        piece.undo_move
        expect(piece.pos_x).to eql 0
        expect(piece.pos_y).to eql 6
      end
    end

    context "#white?" do
      it "returns true if the color of the piece equals 'white'" do
        piece = Piece.new([0, 0])
        expect(piece.white?).to eql true
      end

      it "returns false if the color of the piece doesnt equal 'white'" do
        piece = Piece.new([0, 0], 'black')
        expect(piece.white?).to eql false
      end
    end

    context "#to_s" do
      it "returns the unicode_value of the piece" do
        piece = Piece.new([0, 0])
        expect(piece.to_s).to eql "\u263A"
      end
    end

    context "#moved?" do
      it "returns false when it is initialized" do
        piece = Piece.new([0, 0], 'red')
        expect(piece.moved?).to eql false
      end

      it "returns true when it's position is changed once" do
        piece = Piece.new([0, 0], 'red')
        piece.do_move(1, 2)
        expect(piece.moved?).to eql true
      end
    end

    context "#color_is?(color)" do
      it "returns true if the color parameter equals piece's color" do
        piece = Piece.new([0, 0])
        expect(piece.color_is?('white')).to eql true
      end

      it "returns false if the color parameter doesnt equal piece's color" do
        piece = Piece.new([0, 0])
        expect(piece.color_is?('black')).to eql false
      end
    end
  end
end
