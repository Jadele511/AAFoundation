require_relative 'board'
require_relative 'human_player'
require "byebug"

class Game

    attr_reader :p1_mark, :p2_mark, :current_player
    def initialize(p1_mark, p2_mark)
        @p1_mark = HumanPlayer.new(p1_mark)
        @p2_mark = HumanPlayer.new(p2_mark)
        @board = Board.new
        @current_player = @p1_mark
    end

    def switch_turn
        @current_player = @current_player == @p1_mark ? @p2_mark : p1_mark 
    end

    def play 
        while @board.empty_positions?
            @board.print
            pos = @current_player.get_position
            @board.place_mark(pos, @current_player.mark)
            if @board.win?(@current_player.mark)
                p "#{@current_player.mark} won"
                return
            else
                self.switch_turn
            end
        end
        p 'No one won'
    end
end