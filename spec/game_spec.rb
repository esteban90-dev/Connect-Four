require "./lib/game.rb"

describe Game do

  TestPlayer = Struct.new(:name, :color)
  TestConsole = Struct.new(:input, :output)
  let (:sean) { TestPlayer.new( { :name => "sean", :color => "X"} ) }
  let (:alex) { TestPlayer.new( { :name => "alex", :color => "O"} ) }
  let (:console1) { double("console") }
  let (:board1) { double("board") }

  context "#initialize" do
    it "Raises an exception when initialized with an empty {}" do 
      expect{ Game.new({}) }.to raise_error(KeyError)
    end
    
    it "Does not raise an exception when initialized with a valid input {}" do
      players = [sean, alex]
      expect{ Game.new({ :players => players, :board =>  board1, :console => console1 }) }.not_to raise_error(KeyError)
    end

    it "Randomly assigns the current player" do
      players = [sean, alex]
      allow(players).to receive(:shuffle).and_return([sean,alex])
      game1 = Game.new({ :players => players, :board =>  board1, :console => console1 })
      expect(game1.current_player).to eql(sean)
    end

    it "Randomly assigns the other player" do
      players = [sean, alex]
      allow(players).to receive(:shuffle).and_return([sean,alex])
      game1 = Game.new({ :players => players, :board =>  board1, :console => console1 })
      expect(game1.other_player).to eql(alex)
    end
  end

  context "#players" do
    it "Returns the array of players" do
      players = [sean, alex]
      game1 = Game.new({ :players => players, :board =>  board1, :console => console1 })
      expect(game1.players).to eql(players)
    end
  end

  context "#board" do
    it "Returns the board" do 
      players = [sean, alex]
      game1 = Game.new({ :players => players, :board =>  board1, :console => console1 })
      expect(game1.board).to eql(board1)
    end
  end

  context "#console" do
    it "Returns the console" do
      players = [sean, alex]
      game1 = Game.new({ :players => players, :board =>  board1, :console => console1 })
      expect(game1.console).to eql(console1)
    end
  end

  context "#switch_players" do
    it "Switches the current_player and the other_player" do
      players = [sean, alex]
      allow(players).to receive(:shuffle).and_return([sean,alex])
      game1 = Game.new({ :players => players, :board =>  board1, :console => console1 })
      game1.switch_players
      expect(game1.current_player).to eql(alex)
    end
  end

  context "#prompt_player" do
    it "Sends an output message to the console" do 
      players = [sean, alex]
      game1 = Game.new({ :players => players, :board =>  board1, :console => console1 })
      message = "Select a column to fill."
      expect(game1.console).to receive(:prompt).with(message)
      game1.prompt_player
    end
  end

  context "#result" do
    it "returns a message with the current player's name if a winner was detected" do
      players = [sean, alex]
      game1 = Game.new({ :players => players, :board =>  board1, :console => console1 })
      message = "#{game1.current_player} is the winner!"
      allow(game1.board).to receive(:winner?).and_return(true)
      expect(game1.result).to eql(message)
    end
  end

end