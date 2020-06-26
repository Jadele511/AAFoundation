class Board

    attr_reader :n
    def initialize(n)
        @n = n
        @grid =  Array.new(n) {Array.new(n, '_')}
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end 

    def valid?(pos)
        row, col = pos
        (row >= 0 && row < @n) && (col >= 0 && col < @n)
    end

    def empty?(pos)
        self[pos] == '_'
    end

    def place_mark(pos, mark)
        if !self.valid?(pos) || !self.empty?(pos)
            raise 'Invalid position'
        else
            self[pos] = mark
        end
    end

    def print
        @grid.each {|row| p row}
    end

    def win_row?(mark)
        @grid.any? {|row| row.uniq.length == 1 && row.uniq[0] == mark}
    end

    def win_col?(mark)
        @grid.transpose.any? {|col| col.uniq.length == 1 && col.uniq[0] == mark}
    end

    def win_diagonal?(mark)
        left = []
        right = []
        (0...@grid.length).each do |i|
            left << @grid[i][i] 
            right << @grid[i][@grid.length-1-i] 
        end

        left.uniq[0] == mark || right.uniq[0] == mark
    end

    def win?(mark)
        (left.uniq.length == 1 && left.uniq[0] == mark) || (right.uniq.length == 1 && right.uniq[0] == mark)
    end

    def empty_positions?
        @grid.each do |row|
            return row.any? {|pos| pos == '_'}
        end
    end

    def legal_positions
        res = []
        (0...@n).each do |i|
            (0...@n).each do |j|
                res << [i, j] if @grid[i][j] == '_'
            end
        end
        res
    end


end