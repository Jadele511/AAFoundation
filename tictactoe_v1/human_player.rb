class HumanPlayer

    attr_reader :mark
    def initialize(mark)
        @mark = mark
    end

    def get_position
        p 'enter a position with coordinates separated with a space like `4 7`'
        input = gets.chomp
        raise "There should be 2 numbers or one space only" if input.length != 3 
        input.split.map do |ch|
            if ch.to_i.to_s != ch
                raise "position should be 2 numbers"
            else
                ch.to_i
            end
        end
    end
end