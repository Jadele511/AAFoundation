class HumanPlayer

    attr_reader :mark
    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)
        pos = nil
        until legal_positions.include?(pos)
            p "Player #{@mark}, enter a position with coordinates separated with a space like `4 7`"
            pos = gets.chomp.split.map do |ch|
                if ch.to_i.to_s != ch
                    raise "position should be 2 numbers"
                else
                    ch.to_i
                end
            end
            raise "There should be 2 numbers or one space only" if pos.length != 2
            p 'position is not legal, please enter new position' if !legal_positions.include?(pos)
        end
        pos
    end
end