class Item

    attr_reader :deadline, :done
    attr_accessor :title, :description
    def self.valid_date?(date_string)
        date = date_string.split('-')
        return false if date[1].to_i < 1 || date[1].to_i > 12
        return false if date[2].to_i < 1 || date[2].to_i > 31
        true
    end

    def initialize(title, deadline, description)
        @title = title
        @deadline = deadline
        @description = description
        @done = '[ ]'
    end

    def deadline=(new_deadline)
        if Item.valid_date?(new_deadline)
             @deadline = new_deadline
        else 
            raise 'Invalid date'
        end
    end

    def toggle
        @done = @done == '[ ]' ? '[X]' : '[ ]'
    end
end