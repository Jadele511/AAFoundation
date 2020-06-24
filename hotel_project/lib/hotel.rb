require_relative "room"

class Hotel

    attr_reader :rooms
    def initialize(name, capacities)
        @name = name
        @rooms = Hash.new
        capacities.each do |name, capacity|
            @rooms[name] = Room.new(capacity)
        end
    end

    def name
        @name.split.map(&:capitalize).join(' ')
    end

    def room_exists?(room)
        @rooms.include?(room) ? true : false
    end

    def check_in(person, room)
        if !room_exists?(room)
            p 'sorry, room does not exist'
        else
            if @rooms[room].add_occupant(person)
                p 'check in successful'
            else
                p 'sorry, room is full'
            end
            true
        end
    end

    def has_vacancy?
        @rooms.values.any? {|room| !room.full?}
    end

    def list_rooms
        @rooms.each do |name, room|
            puts "#{name} has #{room.available_space}"
        end
    end

end
