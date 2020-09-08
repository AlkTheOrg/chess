require_relative '../spec_helper.rb'
module Chess
  describe Rook do
    context "#initialize" do
      it "initializes a piece with position and name" do
        expect { Rook.new([0, 0]) }.to_not raise_error
      end

      it "takes an optional color parameter" do
        expect { Rook.new([0, 0], 'red') }.to_not raise_error
      end
    end

    context "#attr_readers" do
      it "returns the value of its pos_x, pos_y, name and color" do
        rook = Rook.new([0, 0], 'black')
        expect(rook.pos_x).to eql 0
        expect(rook.pos_y).to eql 0
        expect(rook.unicode_value).to eql "\u265C"
        expect(rook.color).to eql 'black'
        expect(rook.value).to eql 5
      end
    end

    context "#do_move" do
      it "updates the x and y values of the piece" do
        rook = Rook.new([0, 0])
        rook.do_move(5, 3)
        expect(rook.pos_x).to eql 5
        expect(rook.pos_y).to eql 3
      end
    end

    context "#white?" do
      it "returns true if the color of the piece equals 'white'" do
        rook = Rook.new([0, 0])
        expect(rook.white?).to eql true
      end

      it "returns false if the color of the piece doesnt equal 'white'" do
        rook = Rook.new([0, 0], 'black')
        expect(rook.white?).to eql false
      end
    end

    context "#to_s" do
      it "returns the unicode_value of the piece" do
        rook = Rook.new([0, 0])
        expect(rook.to_s).to eql "\u2656"
      end
    end

    context "#moved?" do
    it "returns false when it is initialized" do
      rook = Rook.new([0, 0], 'red')
      expect(rook.moved?).to eql false
    end

    it "returns true when it's position is changed once" do
      rook = Rook.new([0, 0], 'red')
      rook.do_move(1, 2)
      expect(rook.moved?).to eql true
    end
  end
  end
end
