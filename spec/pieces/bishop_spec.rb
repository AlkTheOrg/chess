require_relative '../spec_helper.rb'
module Chess
  describe Bishop do
    context "#initialize" do
      it "initializes a piece with position and name" do
        expect { Bishop.new([0, 0]) }.to_not raise_error
      end

      it "takes an optional color parameter" do
        expect { Bishop.new([0, 0], 'red') }.to_not raise_error
      end
    end

    context "#attr_readers" do
      it "returns the value of its pos_x, pos_y, name and color" do
        bishop = Bishop.new([0, 0], 'black')
        expect(bishop.pos_x).to eql 0
        expect(bishop.pos_y).to eql 0
        expect(bishop.unicode_value).to eql "\u265D"
        expect(bishop.color).to eql 'black'
        expect(bishop.value).to eql 3
      end
    end

    context "#do_move" do
      it "updates the x and y values of the piece" do
        bishop = Bishop.new([0, 0])
        bishop.do_move(5, 3)
        expect(bishop.pos_x).to eql 5
        expect(bishop.pos_y).to eql 3
      end
    end

    context "#white?" do
      it "returns true if the color of the piece equals 'white'" do
        bishop = Bishop.new([0, 0])
        expect(bishop.white?).to eql true
      end

      it "returns false if the color of the piece doesnt equal 'white'" do
        bishop = Bishop.new([0, 0], 'black')
        expect(bishop.white?).to eql false
      end
    end

    context "#to_s" do
      it "returns the unicode_value of the piece" do
        bishop = Bishop.new([0, 0])
        expect(bishop.to_s).to eql "\u2657"
      end
    end

    context "#moved?" do
    it "returns false when it is initialized" do
      bishop = Bishop.new([0, 0], 'red')
      expect(bishop.moved?).to eql false
    end

    it "returns true when it's position is changed once" do
      bishop = Bishop.new([0, 0], 'red')
      bishop.do_move(1, 2)
      expect(bishop.moved?).to eql true
    end
  end
  end
end
