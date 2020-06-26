class Board

    def initialize
        @grid =  Array.new(3) {Array.new(3, '_')}
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
        (row >= 0 && row < 3) && (col >= 0 && col < 3)
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

        (left.uniq.length == 1 && left.uniq[0] == mark) || (right.uniq.length == 1 && right.uniq[0] == mark)
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.each do |row|
            return row.any? {|pos| pos == '_'}
        end
    end


end