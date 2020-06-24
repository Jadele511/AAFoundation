require_relative 'passenger'

class Flight

    attr_reader :passengers
    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def full?
        @capacity == @passengers.length
    end

    def board_passenger(passenger)
        if !full? && passenger.has_flight?(@flight_number)
           @passengers <<  passenger
        end
    end

    def list_passengers
        res = []
        @passengers.each {|pass| res << pass.name}
        res 
    end

    def [](idx)
        @passengers[idx]
    end

    def <<(passenger)
        board_passenger(passenger)
    end

end