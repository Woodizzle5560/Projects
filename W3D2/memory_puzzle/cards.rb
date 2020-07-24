class Card
    attr_writer :face_up
    attr_reader :face_up, :value

    def initialize(val)
        @value = val
        @face_up = false 
    end

    def self.get_random_card
        val = rand((1..100))
        Card.new(val)
    end

    def flip
        self.face_up ? self.face_up = false : self.face_up = true
    end

end