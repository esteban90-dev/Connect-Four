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

  def play
    console.write(board.formatted)
    loop do
      input = prompt_player
      console.write(board.formatted)
      break if game_over?
    end
    console.write(result)
  end

  def switch_players
    self.current_player, self.other_player = other_player, current_player
  end

  def prompt_player
    input = ""
    loop do
      input = console.prompt("Select a column to fill.")
      break unless invalid?(input)
      console.write("Invalid input.")
    end
    input.to_i
  end

  def result
    return "#{current_player} is the winner!" if board.winner?
    return "Game was a tie!" if board.tie?
  end

  def game_over?
    return true if board.winner?
    return true if board.tie?
    false
  end

  def invalid?(input)
    return true unless input.match?(/^[0-9]$/)
    return true if input.to_i >= board.columns
    return true if board.column_full?(input.to_i)
    false
  end
end