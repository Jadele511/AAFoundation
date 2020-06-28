require_relative 'item'
require_relative 'list'
require 'byebug'

class TodoBoard
    attr_accessor :list
    def initialize(label)
        @list = {}   
    end

    def get_command
        print "\nEnter a command: "
        cmd, label, *args = gets.chomp.split(' ')
        case cmd
        when 'mklist'       
                @list[label] = List.new(label)
        when 'ls'
            @list.each {|k,v| p k}
        when 'showall'
            @list.each {|k,v| v.print}
        when 'mktodo'
            @list[label].add_item(*args)
        when 'up'
            @list[label].up(*args.map(&:to_i))
        when 'down'
            @list[label].down(*args.map(&:to_i))
        when 'swap'
            @list[label].swap(*args.map(&:to_i))
        when 'sort'
            @list[label].sort_by_date!
        when 'priority'
            @list[label].print_priority
        when 'print'
            if args.empty?
                @list[label].print
            else
                @list[label].print_full_item(args[0].to_i)
            end
        when 'toggle'
            @list[label].toggle_item(args[0].to_i)
        when 'rm'
            @list[label].remove_item(args[0].to_i)
        when 'purge'
            @list[label].purge
        when 'quit'
            return false
        else
            print "Sorry, that command is not recognized."
        end
        true
    end

    def run 
        while get_command
            return if !get_command
        end
    end
end
