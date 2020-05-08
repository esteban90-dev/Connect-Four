class Game
  attr_reader :players, :board, :current_player, :other_player
  def initialize(input)
    @players = input.fetch(:players)
    @board = input.fetch(:board)
    @current_player, @other_player = players.shuffle
  end
end