require "./lib/game.rb"

describe Game do

  TestPlayer = Struct.new(:name, :color)
  let (:sean) { TestPlayer.new( { :name => "sean", :color => "X"} ) }
  let (:alex) { TestPlayer.new( { :name => "john", :color => "O"} ) }
  board1 = Array.new(6){ Array.new(7) }

  context "#initialize" do
    it "Raises an exception when initialized with an empty {}" do 
      expect{ Game.new({}) }.to raise_error(KeyError)
    end
    
    it "Does not raise an exception when initialized with a valid input {}" do
      players = [sean, alex]
      expect{ Game.new({ :players => players, :board =>  board1 }) }.not_to raise_error(KeyError)
    end
  end


end