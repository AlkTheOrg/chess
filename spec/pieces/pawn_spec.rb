require_relative '../spec_helper.rb'
module Chess
  describe Pawn do
    context "#initialize" do
      it "initializes a piece with position and name" do
        expect { Pawn.new([0, 0]) }.to_not raise_error
      end

      it "takes an optional color parameter" do
        expect { Pawn.new([0, 0], 'red') }.to_not raise_error
      end
    end

    context "#attr_readers" do
      it "returns the value of its pos_x, pos_y, name and color" do
        pawn = Pawn.new([0, 0], 'black')
        expect(pawn.pos_x).to eql 0
        expect(pawn.pos_y).to eql 0
        expect(pawn.unicode_value).to eql "\u265F"
        expect(pawn.color).to eql 'black'
        expect(pawn.value).to eql 1
      end
    end

    context "#do_move" do
      it "updates the x and y values of the piece" do
        pawn = Pawn.new([0, 0])
        pawn.do_move(5, 3)
        expect(pawn.pos_x).to eql 5
        expect(pawn.pos_y).to eql 3
      end
    end

    context "#white?" do
      it "returns true if the color of the piece equals 'white'" do
        pawn = Pawn.new([0, 0])
        expect(pawn.white?).to eql true
      end

      it "returns false if the color of the piece doesnt equal 'white'" do
        pawn = Pawn.new([0, 0], 'black')
        expect(pawn.white?).to eql false
      end
    end

    context "#to_s" do
      it "returns the unicode_value of the piece" do
        pawn = Pawn.new([0, 0])
        expect(pawn.to_s).to eql "\u2659"
      end
    end

    context "#moved?" do
    it "returns false when it is initialized" do
      pawn = Pawn.new([0, 0], 'red')
      expect(pawn.moved?).to eql false
    end

    it "returns true when it's position is changed once" do
      pawn = Pawn.new([0, 0], 'red')
      pawn.do_move(1, 2)
      expect(pawn.moved?).to eql true
    end
  end
  end
end
