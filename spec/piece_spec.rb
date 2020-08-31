require 'spec_helper.rb'

module Chess
  describe Piece do
    context "#initialize" do
      it "initializes a piece with position and name" do
        expect { Piece.new([0, 0], 'pawn') }.to_not raise_error
      end

      it "takes an optional color parameter" do
        expect { Pieace.new([0, 0], 'pawn', 'red') }.to_not raise_error
      end
    end

    context "#attr_readers" do
      it "returns the value of its pos_x, pos_y, name and color" do
        piece = Piece.new([0, 0], 'pawn', 'black')
        expect(piece.pos_x).to eql 0
        expect(piece.pos_y).to eql 0
        expect(piece.name).to eql 'pawn'
        expect(piece.color).to eql 'black'
      end
    end

    context "#name_piece" do
      it "makes the name uppercase if its color is white" do
        piece = Piece.new([0, 0], 'queen')
        expect()
      end

      it "makes the name lowercase if its color is black" do
        
      end
    end

    context "#update_possible_moves" do
      
    end

    context "#update_position" do
      
    end

    context "#to_s" do
      
    end
  end
end
