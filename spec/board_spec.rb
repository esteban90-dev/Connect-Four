require "./lib/board.rb"

describe Board do
  context "#initialize" do
    it "creates a grid of 7 columns by default" do
      board1 = Board.new
      expect(board1.grid.size).to eql(7)
    end

    it "creates a grid where each column has 6 things in it by default" do
      board1 = Board.new
      board1.grid.each do |column|
        expect(column.size).to eql(6)
      end
    end
  end

  context "#get_cell" do
    it "returns the contents of grid coordinate" do
      board1 = Board.new
      board1.push(3,33)
      expect(board1.get_cell([3,0])).to eql(33)
    end
  end

  context "#push" do
    it "Pushes values into a column of the grid" do
      board1 = Board.new
      board1.push(6,55)
      expect(board1.get_cell([6][0])).to eql(55)
    end
  end

end