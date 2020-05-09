require "./lib/board.rb"

describe Board do
  context "#initialize" do
    it "creates a default grid of 7 columns" do
      board1 = Board.new
      expect(board1.grid.size).to eql(7)
    end

    it "creates a default grid where each column has a height of 6" do
      board1 = Board.new
      board1.grid.each do |column|
        expect(column.size).to eql(6)
      end
    end

    it "creates a default grid where each element responds to the #value message" do
      board1 = Board.new
      board1.grid.each do |column|
        expect(column.all?{ |element| element.respond_to?(:value) }).to eql(true)
      end
    end

    it "creates a custom grid of 10 columns" do
      board = Board.new({:columns => 10, :height => 8})
      expect(board.grid.size).to eql(10)
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

  context "#formatted" do
    it "Returns the formatted grid as a string" do
      board1 = Board.new
      expect(board1.formatted).to be_a(String)
    end
  end

  context "#winner?" do 
    it "Returns false when the board is empty" do
      board1 = Board.new
      expect(board1.winner?).to eql(false)
    end

    it "Returns false when the board is filled with random values" do
      board1 = Board.new
      board1.push(0,"1")
      board1.push(1,"2")
      board1.push(1,"3")
      board1.push(2,"4")
      board1.push(2,"5")
      board1.push(2,"6")
      board1.push(3,"7")
      board1.push(3,"8")
      board1.push(3,"9")
      board1.push(3,"1")
      expect(board1.winner?).to eql(false)
    end

    it "Returns true when a column has four in a row" do
      board1 = Board.new
      board1.push(3,"X")
      board1.push(3,"X")
      board1.push(3,"X")
      board1.push(3,"X")
      expect(board1.winner?).to eql(true)
    end

    it "Returns true when a row has has four in a row" do
      board1 = Board.new
      board1.push(0,"X")
      board1.push(1,"X")
      board1.push(2,"X")
      board1.push(3,"X")
      expect(board1.winner?).to eql(true)
    end

    it "Returns true when a diagonal in one dimension has four in a row" do
      board1 = Board.new
      board1.push(0,"X")
      board1.push(1,"O")
      board1.push(1,"X")
      board1.push(2,"O")
      board1.push(2,"O")
      board1.push(2,"X")
      board1.push(3,"O")
      board1.push(3,"O")
      board1.push(3,"O")
      board1.push(3,"X")
      expect(board1.winner?).to eql(true)
    end

    it "Returns true when a diagonal in the other dimension has four in a row" do
      board1 = Board.new
      board1.push(0,"X")
      board1.push(0,"X")
      board1.push(0,"X")
      board1.push(0,"O")
      board1.push(1,"X")
      board1.push(1,"X")
      board1.push(1,"O")
      board1.push(2,"X")
      board1.push(2,"O")
      board1.push(3,"O")
      expect(board1.winner?).to eql(true)
    end
  end

  context "#tie?" do
    it "Returns true when the grid is full and winner? returns false" do
      board1 = Board.new({:columns=>4, :height=>4})
      board1.push(0,"a")
      board1.push(0,"b")
      board1.push(0,"c")
      board1.push(0,"d")
      board1.push(1,"e")
      board1.push(1,"f")
      board1.push(1,"g")
      board1.push(1,"h")
      board1.push(2,"i")
      board1.push(2,"j")
      board1.push(2,"k")
      board1.push(2,"l")
      board1.push(3,"m")
      board1.push(3,"n")
      board1.push(3,"o")
      board1.push(3,"p")
      expect(board1.tie?).to eql(true)
    end

    it "Returns false when the grid is full and winner? returns true" do
      board1 = Board.new({:columns=>4, :height=>4})
      4.times{ board1.push(0, "a") }
      4.times{ board1.push(1, "a") }
      4.times{ board1.push(2, "a") }
      4.times{ board1.push(3, "a") }
      expect(board1.tie?).to eql(false)
    end
  end
end