require_relative '../spec_helper.rb'
module Chess
  describe Knight do
    context "#initialize" do
      it "initializes a piece with position and name" do
        expect { Knight.new([0, 0]) }.to_not raise_error
      end

      it "takes an optional color parameter" do
        expect { Knight.new([0, 0], 'red') }.to_not raise_error
      end
    end

    context "#attr_readers" do
      it "returns the value of its pos_x, pos_y, name and color" do
        knight = Knight.new([0, 0], 'black')
        expect(knight.pos_x).to eql 0
        expect(knight.pos_y).to eql 0
        expect(knight.unicode_value).to eql "\u265E"
        expect(knight.color).to eql 'black'
        expect(knight.value).to eql 3
      end
    end

    context "#do_move" do
      it "updates the x and y values of the piece" do
        knight = Knight.new([0, 0])
        knight.do_move(5, 3)
        expect(knight.pos_x).to eql 5
        expect(knight.pos_y).to eql 3
      end
    end

    context "#white?" do
      it "returns true if the color of the piece equals 'white'" do
        knight = Knight.new([0, 0])
        expect(knight.white?).to eql true
      end

      it "returns false if the color of the piece doesnt equal 'white'" do
        knight = Knight.new([0, 0], 'black')
        expect(knight.white?).to eql false
      end
    end

    context "#to_s" do
      it "returns the unicode_value of the piece" do
        knight = Knight.new([0, 0])
        expect(knight.to_s).to eql "\u2658"
      end
    end

    context "#moved?" do
    it "returns false when it is initialized" do
      knight = Knight.new([0, 0], 'red')
      expect(knight.moved?).to eql false
    end

    it "returns true when it's position is changed once" do
      knight = Knight.new([0, 0], 'red')
      knight.do_move(1, 2)
      expect(knight.moved?).to eql true
    end
  end
  end
end
