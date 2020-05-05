require "./lib/cell.rb"

describe Cell do
  context "#initialize" do
    it "initializes with an empty string by default" do
      cell1 = Cell.new
      expect(cell1.value).to eql("")
    end

    it "can be initialized with a character like 'X'" do
      cell1 = Cell.new("X")
      expect(cell1.value).to eql("X")
    end
  end

  context "#value" do
    it "The value attribute can be set" do
      cell1 = Cell.new
      cell1.value = "X"
      expect(cell1.value).to eql("X")
    end
  end
end