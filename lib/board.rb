class Board
  attr_reader :grid

  def initialize(input={})
    @grid = input.fetch(:grid, default_grid)
  end

  def push(column, value)
    i = 0
    while i < grid[column].length
      if grid[column][i].value == ""
        grid[column][i].value = value
        break
      end
      i += 1
    end
  end

  private

  def default_grid
    Array.new(7){ Array.new(6){ Cell.new } }
  end

end