require "./lib/board.rb"

describe Board do
  context "#initialize" do
    it "creates a grid of 7 columns by default" do
      board1 = Board.new
      expect(board1.grid.size).to eql(7)
    end

    it "creates a grid where each column has a length of 6 by default" do
      board1 = Board.new
      board1.grid.each do |column|
        expect(column.size).to eql(6)
      end
    end

    it "creates a grid where each grid coordinate is nil by default" do
      board1 = Board.new
      board1.grid.each do |column|
        expect(column.all?{ |value| value.nil? }).to eql(true)
      end
    end
  end

end