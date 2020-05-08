class Game
  attr_reader :players, :board
  attr_accessor :current_player, :other_player

  def initialize(input)
    @players = input.fetch(:players)
    @board = input.fetch(:board)
    @current_player, @other_player = players.shuffle
  end

  public

  def switch_players
    self.current_player, self.other_player = other_player, current_player
  end
end