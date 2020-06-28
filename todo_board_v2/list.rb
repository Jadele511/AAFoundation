require_relative 'item'
require "byebug"

class List

    attr_accessor :label
    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description=nil)
        item = Item.new(title, deadline, description)
        if Item.valid_date?(deadline)
            @items << item
            return true
        else
            return false
        end
    end

    def size
        @items.length
    end

    def valid_index?(idx)
        idx >= 0 && idx < @items.length
    end

    def swap(idx_1, idx_2)
        if !valid_index?(idx_1) || !valid_index?(idx_2)
            raise 'Invalid index'
            return false
        else
            @items[idx_1], @items[idx_2] = @items[idx_2], @items[idx_1]
            return true
        end
    end

    def [](idx)
        return nil if !valid_index?(idx)
        @items[idx]
    end

    def priority
        @items.first
    end

    def print
        p '-' * 50
        p ' ' * 20 + @label + '' * 20
        p '-' * 50
        p "#{'Index'.ljust(7)}|  #{'Item'.ljust(18)}|  #{'Deadline'.ljust(10)}|  #{'Done'.ljust(4)}" 
        @items.each_with_index do |item, i|
            p "#{i.to_s.ljust(7)}|  #{item.title.ljust(18)}|  #{item.deadline.ljust(10)}|  #{item.done.ljust(4)}"
        end

    end

    def print_full_item(idx)
        p '-' * 50
        if valid_index?(idx)
            p @items[idx].title.ljust(25) + @items[idx].deadline.ljust(15) + @items[idx].done
            p @items[idx].description if @items[idx].description != nil
        end
        p '-' * 50
    end

    def print_priority
        print_full_item(0)
    end

    def up(idx, amount = 1)
        return false if !valid_index?(idx)
        while amount > 0 && idx > 0
            swap(idx, idx-1)
            idx -= 1
            amount -= 1
        end
        true      
    end

    def down(idx, amount  = 1)
        return false if !valid_index?(idx)
        while amount > 0  && idx < self.size - 1
            swap(idx, idx+1)
            idx += 1
            amount -= 1
        end
        true
    end

    def sort_by_date!
        @items.sort_by! {|item| item.deadline}
    end

    def toggle_item(idx)
        @items[idx].toggle
    end

    def remove_item(idx)
        return false if !valid_index?(idx)
        @items.delete(@items[idx])
        true
    end

    def purge
        @items.reject! {|item| item.done == '[X]'}
    end

end


