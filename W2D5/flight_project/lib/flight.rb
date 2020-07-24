require_relative "./passenger.rb"

class Flight

    attr_reader :passengers

    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def full?
        self.passengers.length == @capacity
    end

    def board_passenger(pass_inst)
        if !self.full? && pass_inst.has_flight?(@flight_number)
            self.passengers << pass_inst #ask TA about this
            true
        end
        false
    end

    def list_passengers
        self.passengers.map {|pass| pass.name }
    end

    def [](idx)
        self.passengers[idx]
    end

    def <<(pass_inst)
        self.board_passenger(pass_inst)
    end
    
end