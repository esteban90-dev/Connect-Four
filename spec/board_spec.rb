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
    it "Prints the formatted grid to the console as a string" do
      board1 = Board.new
      expect{ board1.formatted }.to output(String).to_stdout
    end
  end

  context "#winner?" do 
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
end