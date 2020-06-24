class Board
  attr_reader :size

  def self.print_grid(grid)
    grid.each do |row| 
        puts row.join(' ')
    end
  end

  def initialize(n)
    @grid = Array.new(n) {Array.new(n, :N)}
    @size = n * n
  end

  def [](pos)
    # row = pos[0]
    # col = pos[1]
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def num_ships
    @grid.flatten.count {|el| el == :S}
  end

  def attack(pos)
    if self[pos] == :S 
        self[pos] = :H
        p 'you sunk my battleship!'
        true
    else
        self[pos] = :X
        false
    end
  end

  def place_random_ships
    num = @size * 0.25
    n = @grid.length
    while self.num_ships < num
        row = rand(0...n)
        col = rand(0...n)
        @grid[row][col] = :S
    end
  end

  def hidden_ships_grid
    @grid.map do |row|
        row.map do |ele|
            ele == :S ? :N : ele      
        end
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end
end
