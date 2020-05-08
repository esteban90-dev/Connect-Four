require "./lib/game.rb"

describe Game do

  TestPlayer = Struct.new(:name, :color)
  let (:sean) { TestPlayer.new( { :name => "sean", :color => "X"} ) }
  let (:alex) { TestPlayer.new( { :name => "alex", :color => "O"} ) }
  board1 = Array.new(6){ Array.new(7) }

  context "#initialize" do
    it "Raises an exception when initialized with an empty {}" do 
      expect{ Game.new({}) }.to raise_error(KeyError)
    end
    
    it "Does not raise an exception when initialized with a valid input {}" do
      players = [sean, alex]
      expect{ Game.new({ :players => players, :board =>  board1 }) }.not_to raise_error(KeyError)
    end

    it "Randomly assigns the current player" do
      players = [sean, alex]
      allow(players).to receive(:shuffle).and_return([sean,alex])
      game1 = Game.new({ :players => players, :board =>  board1 })
      expect(game1.current_player).to eql(sean)
    end

    it "Randomly assigns the other player" do
      players = [sean, alex]
      allow(players).to receive(:shuffle).and_return([sean,alex])
      game1 = Game.new({ :players => players, :board =>  board1 })
      expect(game1.other_player).to eql(alex)
    end
  end

  context "#players" do
    it "Returns the array of players" do
      players = [sean, alex]
      game1 = Game.new({ :players => players, :board =>  board1 })
      expect(game1.players).to eql(players)
    end
  end

  context "#board" do
    it "Returns the board" do 
      players = [sean, alex]
      game1 = Game.new({ :players => players, :board =>  board1 })
      expect(game1.board).to eql(board1)
    end
  end

end