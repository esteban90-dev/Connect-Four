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

  context "#get_element" do
    it "returns an element that is empty" do
      board1 = Board.new
      expect(board1.get_element(0,0)).to eql(nil)
    end

    it "returns a cell that has been filled with an integer" do
      board1 = Board.new
      board1.push(6,55)
      expect(board1.get_element(6,0)).to eql(55)
    end

    it "returns a cell that has been filled with an object" do
      board1 = Board.new
      TestCell = Struct.new(:name)
      cell1 = TestCell.new("junk")
      board1.push(0, cell1)
      expect(board1.get_element(0,0)).to eql(cell1)
    end
  end

end