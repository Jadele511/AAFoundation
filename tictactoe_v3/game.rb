require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'
require 'byebug'

class Game

    attr_reader :current_player, :board
    def initialize(n, players_hash)
        @players_hash = players_hash
        @players = []
        @players_hash.each do |mark, bool|
            if bool == false
                @players << HumanPlayer.new(mark)
            elsif bool == true
                @players << ComputerPlayer.new(mark)
            end
        end 
        @board = Board.new(n)
        @current_player = @players.first
    end

    def switch_turn
        @current_player = @players.rotate!.first
    end
 
    def play 
        while @board.empty_positions?
            @board.print
            pos = @current_player.get_position(@board.legal_positions)
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

