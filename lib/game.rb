class Game
  def initialize(input)
    @players = input.fetch(:players)
    @board = input.fetch(:board)
  end
end