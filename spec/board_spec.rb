require "./lib/board.rb"

describe Board do
  context "#initialize" do
    it "creates a grid of 6 rows by default" do
      board1 = Board.new
      expect(board1.grid.size).to eql(6)
    end

    it "creates a grid where each row has 7 things in it by default" do
      board1 = Board.new
      board1.grid.each do |row|
        expect(row.length).to eql(7)
      end
    end

  end
end