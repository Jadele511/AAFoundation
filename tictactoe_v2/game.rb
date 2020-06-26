require_relative 'board'
require_relative 'human_player'

class Game

   
    def initialize(n, *players)
        @players = *players
        @players.map! {|player| player = HumanPlayer.new(player)}
        @board = Board.new(n)
        @current_player = @players.first
    end

    def switch_turn
        @current_player = @players.rotate!.first
    end

    def play 
        while @board.empty_positions?
            @board.print
            pos = @current_player.get_position
            @board.place_mark(pos, @current_player.mark)
            if @board.win?(@current_player.mark)
                p "#{@current_player.mark} won"
                return true
            else
                self.switch_turn
            end
        end
        p 'No one won'
    end
end