require "./lib/player.rb"

describe Player do
  context "#initialize" do
    it "Raises an exception when initialized with an empty {}" do 
      expect{ Player.new({}) }.to raise_error(KeyError)
    end

    it "Does not raise an exception when initialized with a valid input {}" do
      expect{ Player.new({ :name => "john", :color => "X" }) }.not_to raise_error(KeyError)
    end
  end

  context "#name" do
    it "Returns the name of a player" do
      player1 = Player.new({ :name => "john", :color => "X" })
      expect(player1.name).to eql("john")
    end
  end

  context "#color" do
    it "Returns the color of a player" do
      player1 = Player.new({ :name => "john", :color => "X" })
      expect(player1.color).to eql("X")
    end
  end
end