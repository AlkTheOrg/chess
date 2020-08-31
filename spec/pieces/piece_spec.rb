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
        expect(piece.value).to eql "\u263B"
        expect(piece.color).to eql 'black'
      end
    end

    context "#update_possible_moves" do
      it "sets the possible move array empty as piece itself is an unknown piece" do
        piece = Piece.new([0, 0])
        expect(piece.possible_moves).to eql []
      end
    end

    context "#update_position" do
      it "updates the x and y values of the piece" do
        piece = Piece.new([0, 0])
        piece.update_position([5, 3])
        expect(piece.pos_x).to eql 5
        expect(piece.pos_y).to eql 3
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
      it "returns the value of the piece" do
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
        piece.update_position([1, 2])
        expect(piece.moved?).to eql true
      end
    end
  end
end
