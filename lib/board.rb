class Board
  attr_reader :grid

  def initialize(input={})
    @grid = build_grid(input.fetch(:columns,7), input.fetch(:height,6))
  end

  def push(column, value)
    i = 0
    while i < grid[column].length
      if grid[column][i].value.nil?
        grid[column][i].value = value
        break
      end
      i += 1
    end
  end

  def formatted
    
    
  end

  private

  def build_grid(columns, height)
    Array.new(columns){ Array.new(height){ Cell.new } }
  end

end