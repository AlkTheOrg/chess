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
        expect(knight.value).to eql "\u265E"
        expect(knight.color).to eql 'black'
      end
    end

    context "#update_position" do
      it "updates the x and y values of the piece" do
        knight = Knight.new([0, 0])
        knight.update_position([5, 3])
        expect(knight.pos_x).to eql 5
        expect(knight.pos_y).to eql 3
      end
    end

    context "#update_possible_moves" do
      it "updates the possible moves by default on initialization" do
        knight = Knight.new([0, 0])
        expect(knight.possible_moves).
          to eql [[2, 1], [1, 2], [-1, 2], [-2, 1], [-2, -1], [-1, -2], [1, -2], [2, -1]]
      end

      it "updates the possible moves after each #update_position" do
        knight = Knight.new([0, 0])
        knight.update_position([2, 1])
        expect(knight.possible_moves).
          to eql [[4, 2], [3, 3], [1, 3], [0, 2], [0, 0], [1, -1], [3, -1], [4, 0]]
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
      it "returns the value of the piece" do
        knight = Knight.new([0, 0])
        expect(knight.to_s).to eql "\u2658"
      end
    end
  end
end
