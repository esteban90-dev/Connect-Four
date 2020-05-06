class Board
  attr_reader :grid

  def initialize(input={})
    @grid = input.fetch(:grid, default_grid)
  end

  private

  def default_grid
    Array.new(7){ Array.new(6){ Cell.new } }
  end
end