require_relative '../spec_helper.rb'
module Chess
  describe Queen do
    context "#initialize" do
      it "initializes a piece with position and name" do
        expect { Queen.new([0, 0]) }.to_not raise_error
      end

      it "takes an optional color parameter" do
        expect { Queen.new([0, 0], 'red') }.to_not raise_error
      end
    end

    context "#attr_readers" do
      it "returns the value of its pos_x, pos_y, name and color" do
        queen = Queen.new([0, 0], 'black')
        expect(queen.pos_x).to eql 0
        expect(queen.pos_y).to eql 0
        expect(queen.unicode_value).to eql "\u265B"
        expect(queen.color).to eql 'black'
        expect(queen.value).to eql 9
      end
    end

    context "#do_move" do
      it "updates the x and y values of the piece" do
        queen = Queen.new([0, 0])
        queen.do_move(5, 3)
        expect(queen.pos_x).to eql 5
        expect(queen.pos_y).to eql 3
      end
    end

    context "#white?" do
      it "returns true if the color of the piece equals 'white'" do
        queen = Queen.new([0, 0])
        expect(queen.white?).to eql true
      end

      it "returns false if the color of the piece doesnt equal 'white'" do
        queen = Queen.new([0, 0], 'black')
        expect(queen.white?).to eql false
      end
    end

    context "#to_s" do
      it "returns the unicode_value of the piece" do
        queen = Queen.new([0, 0])
        expect(queen.to_s).to eql "\u2655"
      end
    end

    context "#moved?" do
    it "returns false when it is initialized" do
      queen = Queen.new([0, 0], 'red')
      expect(queen.moved?).to eql false
    end

    it "returns true when it's position is changed once" do
      queen = Queen.new([0, 0], 'red')
      queen.do_move(1, 2)
      expect(queen.moved?).to eql true
    end
  end
  end
end
