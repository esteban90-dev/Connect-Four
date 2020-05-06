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

    it "creates a grid where each grid element's value is "" by default" do
      board1 = Board.new
      board1.grid.each do |column|
        expect(column.all?{ |element| element.value == "" }).to eql(true)
      end
    end
  end

  context "#grid" do
    it "returns the contents of a cell" do
      board1 = Board.new
      expect(board1.grid[0][0]).not_to eql(nil)
    end
  end

  context "#push" do
    it "Pushes a character into an empty column" do
      board1 = Board.new
      board1.push(6,"X")
      expect(board1.grid[6][0].value).to eql("X")
    end

    it "Pushes a character into a partially filled column" do
      board1 = Board.new
      board1.push(0, "Z")
      board1.push(0, "X")
      expect(board1.grid[0][1].value).to eql("X")
    end
  end
end