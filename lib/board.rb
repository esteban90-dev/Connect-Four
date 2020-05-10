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
    result = ""
    grid.transpose.reverse.each do |row|
      result << row.map{ |element| element.value.nil? ? " " : element.value }.join("  |  ")
      result << "\n"
    end
    result << footer_line_1.join("  |  ")
    result << "\n"
    result << footer_line_2.join("  |  ")
    result << "\n"
    result
  end

  def columns
    grid.length
  end

  def winner?
    return true if winner_column?
    return true if winner_row?
    return true if winner_diagonal?
    false
  end

  def tie?
    return true if !winner? && full?
    false
  end

  def column_full?(column)
    grid[column].all?{ |element| !element.value.nil? }
  end

  private

  def full?
    grid.all?{ |column| column.all?{ |element| !element.value.nil? } }
  end

  def winner_column?
    grid.any?{ |column| four_in_a_row?(column) }
  end

  def winner_row?
    grid.transpose.any?{ |row| four_in_a_row?(row) }
  end

  def winner_diagonal?
    diagonals.any?{ |diagonal| four_in_a_row?(diagonal) }
  end

  def diagonals
    #returns diagonals of a grid that have lenth of 4:
    # grid = [[1, 1, 2, 9],
    #         [7, 2, 4, 9],
    #         [3, 8, 5, 3],
    #         [4, 9, 1, 5]]
    # diagonals returns [[1,2,5,5],[4,8,4,9]]
  
    i = 0
    j = 0
    z = 0
    grid_temp = grid
    temp = []
    result = []
    loop do
      while i < grid_temp.length
        while j < grid_temp[i].length
          begin
            temp.push( grid_temp[i][j], grid_temp[i + 1][j + 1], grid_temp[i + 2][j + 2], grid_temp[i + 3][j + 3] )
          rescue
            temp << nil
          end
          result << temp
          temp = []
          j += 1
        end
        j = 0
        i += 1
      end
      i = 0
      z += 1
      break if z > 1
      grid_temp.reverse!
    end
    result.map{ |array| array.compact }.select{ |array| array.length > 3 }
  end

  def four_in_a_row?(array)
    i = 0
    sum = 1
    while i < array.length - 1
      if array[i].value && array[i].value == array[i + 1].value
        sum += 1
      else
        sum = 1
      end
      break if sum == 4
      i += 1
    end
    return true if sum >= 4
    false
  end

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


