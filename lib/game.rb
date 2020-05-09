class Game
  attr_reader :players, :board, :console
  attr_accessor :current_player, :other_player

  def initialize(input)
    @players = input.fetch(:players)
    @board = input.fetch(:board)
    @console = input.fetch(:console)
    @current_player, @other_player = players.shuffle
  end

  public

  def switch_players
    self.current_player, self.other_player = other_player, current_player
  end

  def prompt_player
    console.prompt("Select a column to fill.")
  end

  def result
    return "#{current_player} is the winner!" if board.winner?
  end
end