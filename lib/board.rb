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
    grid.transpose.reverse.each do |row|
      puts row.map{ |element| element.nil? ? " " : element }.join("  |  ")
    end
    puts footer_line_1.join("  |  ")
    puts footer_line_2.join("  |  ")
  end

  private

  def footer_line_1
    footer = []
    grid.length.times do
      footer << "-"
    end
    footer
  end

  def footer_line_2
    i = 0
    footer = []
    grid.length.times do
      footer << "#{i}"
      i += 1
    end
    footer
  end

  def build_grid(columns, height)
    Array.new(columns){ Array.new(height){ Cell.new } }
  end

end