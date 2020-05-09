require "./lib/game.rb"

describe Game do

  TestPlayer = Struct.new(:name, :color)
  TestConsole = Struct.new(:input, :output)
  let (:sean) { TestPlayer.new( { :name => "sean", :color => "X"} ) }
  let (:alex) { TestPlayer.new( { :name => "alex", :color => "O"} ) }
  let (:players) { [sean, alex] }
  let (:board1) { double("board") }
  let (:console1) { double("console") }

  context "#initialize" do

    it "Raises an exception when initialized with an empty {}" do 
      expect{ Game.new({}) }.to raise_error(KeyError)
    end
    
    it "Does not raise an exception when initialized with a valid input {}" do
      expect{ Game.new({ :players => players, :board =>  board1, :console => console1 }) }.not_to raise_error(KeyError)
    end

    it "Randomly assigns the current player" do
      allow(players).to receive(:shuffle).and_return([sean,alex])
      game1 = Game.new({ :players => players, :board =>  board1, :console => console1 })
      expect(game1.current_player).to eql(sean)
    end

    it "Randomly assigns the other player" do
      allow(players).to receive(:shuffle).and_return([sean,alex])
      game1 = Game.new({ :players => players, :board =>  board1, :console => console1 })
      expect(game1.other_player).to eql(alex)
    end
  end

  context "#players" do
    it "Returns the array of players" do
      game1 = Game.new({ :players => players, :board =>  board1, :console => console1 })
      expect(game1.players).to eql(players)
    end
  end

  context "#board" do
    it "Returns the board" do 
      game1 = Game.new({ :players => players, :board =>  board1, :console => console1 })
      expect(game1.board).to eql(board1)
    end
  end

  context "#console" do
    it "Returns the console" do
      game1 = Game.new({ :players => players, :board =>  board1, :console => console1 })
      expect(game1.console).to eql(console1)
    end
  end

  context "#switch_players" do
    it "Switches the current_player and the other_player" do
      allow(players).to receive(:shuffle).and_return([sean,alex])
      game1 = Game.new({ :players => players, :board =>  board1, :console => console1 })
      game1.switch_players
      expect(game1.current_player).to eql(alex)
    end
  end

  context "#prompt_player" do
    it "Sends an output message to the console" do 
      game1 = Game.new({ :players => players, :board =>  board1, :console => console1 })
      message = "Select a column to fill."
      expect(game1.console).to receive(:prompt).with(message)
      game1.prompt_player
    end
  end

  context "#game_over?" do
    it "Returns true if board.winner? returns true" do
      game1 = Game.new({ :players => players, :board =>  board1, :console => console1 })
      allow(game1.board).to receive(:winner?).and_return(true)
      expect(game1.game_over?).to eql(true)
    end

    it "Returns true if board.tie? returns true" do
      game1 = Game.new({ :players => players, :board =>  board1, :console => console1 })
      allow(game1.board).to receive(:winner?).and_return(false)
      allow(game1.board).to receive(:tie?).and_return(true)
      expect(game1.game_over?).to eql(true)
    end

    it "returns false if board.tie? and board.winner? both return true" do
      game1 = Game.new({ :players => players, :board =>  board1, :console => console1 })
      allow(game1.board).to receive(:winner?).and_return(false)
      allow(game1.board).to receive(:tie?).and_return(false)
      expect(game1.game_over?).to eql(false)
    end
  end

  context "#result" do
    it "returns a message with the current player's name if a winner was detected" do
      game1 = Game.new({ :players => players, :board =>  board1, :console => console1 })
      message = "#{game1.current_player} is the winner!"
      allow(game1.board).to receive(:winner?).and_return(true)
      expect(game1.result).to eql(message)
    end

    it "returns a tie message if there was a tie game" do
      game1 = Game.new({ :players => players, :board =>  board1, :console => console1 })
      message = "Game was a tie!"
      allow(game1.board).to receive(:winner?).and_return(false)
      allow(game1.board).to receive(:tie?).and_return(true)
      expect(game1.result).to eql(message)
    end
  end

end