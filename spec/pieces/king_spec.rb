require_relative '../spec_helper.rb'
module Chess
  describe King do
    context "#initialize" do
      it "initializes a piece with position and name" do
        expect { King.new([0, 0]) }.to_not raise_error
      end

      it "takes an optional color parameter" do
        expect { King.new([0, 0], 'red') }.to_not raise_error
      end
    end

    context "#attr_readers" do
      it "returns the value of its pos_x, pos_y, name and color" do
        king = King.new([0, 0], 'black')
        expect(king.pos_x).to eql 0
        expect(king.pos_y).to eql 0
        expect(king.unicode_value).to eql "\u265A"
        expect(king.color).to eql 'black'
        expect(king.value).to eql 50
      end
    end

    context "#do_move" do
      it "updates the x and y values of the piece" do
        king = King.new([0, 0])
        king.do_move(5, 3)
        expect(king.pos_x).to eql 5
        expect(king.pos_y).to eql 3
      end
    end

    context "#white?" do
      it "returns true if the color of the piece equals 'white'" do
        king = King.new([0, 0])
        expect(king.white?).to eql true
      end

      it "returns false if the color of the piece doesnt equal 'white'" do
        king = King.new([0, 0], 'black')
        expect(king.white?).to eql false
      end
    end

    context "#to_s" do
      it "returns the unicode_value of the piece" do
        king = King.new([0, 0])
        expect(king.to_s).to eql "\u2654"
      end
    end

    context "#moved?" do
    it "returns false when it is initialized" do
      king = King.new([0, 0], 'red')
      expect(king.moved?).to eql false
    end

    it "returns true when it's position is changed once" do
      king = King.new([0, 0], 'red')
      king.do_move(1, 2)
      expect(king.moved?).to eql true
    end
  end
  end
end
