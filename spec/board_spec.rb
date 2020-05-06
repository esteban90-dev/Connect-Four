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

    it "creates a grid where each grid element is nil by default" do
      board1 = Board.new
      board1.grid.each do |column|
        expect(column.all?{ |element| element.nil? }).to eql(true)
      end
    end
  end

  context "#grid" do
    it "returns the contents of a cell" do
      board1 = Board.new
      expect(board1.grid[0][0]).to eql(nil)
    end
  end

  context "#push" do

    TestCell = Struct.new(:name)

    it "Pushes an integer into an empty column" do
      board1 = Board.new
      board1.push(6,55)
      expect(board1.grid[6][0]).to eql(55)
    end

    it "Pushes an object into an empty column" do
      board1 = Board.new
      cell1 = TestCell.new("junk")
      board1.push(0, cell1)
      expect(board1.grid[0][0]).to eql(cell1)
    end

    it "Pushes an object into a partially filled column" do
      board1 = Board.new
      cell1 = TestCell.new("junk")
      cell2 = TestCell.new("junk2")
      board1.push(0, cell1)
      board1.push(0, cell2)
      expect(board1.grid[0][1]).to eql(cell2)
    end
  end
end