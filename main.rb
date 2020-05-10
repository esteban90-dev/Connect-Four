require './lib/board.rb'
require './lib/cell.rb'
require './lib/console.rb'
require './lib/game.rb'
require './lib/player.rb'

console = Console.new
console.write("Welcome to Connect Four!")
input = console.prompt("Enter a name for Player 1.")
player1 = Player.new({:name=> input, :color=>"X"})
input = console.prompt("Enter a name for Player 2.")
player2 = Player.new({:name=> input, :color=>"O"})
board = Board.new({:columns=>4,:height=>4})
game = Game.new({:players => [player1,player2], :board => board, :console => console})
game.play