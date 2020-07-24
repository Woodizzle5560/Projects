require_relative "./cards.rb"
require_relative "./board.rb"

class Game
    def initialize(n)
        @board = Board.new(n)
        @prev_guess = nil
    end

    def run
        puts 'Enter a number for size of board:'
        n = gets.chomp.to_i
        Game.new(n)
        until self.take_turn == true
            "take another turn"
        end

        #still caught in infinate loop
    end

    def take_turn
        puts 'Enter position of card to flip:'
        row, col = gets.chomp.split
        chosen_card = @board[[row.to_i, col.to_i]]
        chosen_card.flip
        @board.print_current

        puts 'Enter positon of second card to flip:'
        row, col = gets.chomp.split
        second_card = @board[[row.to_i, col.to_i]]
        second_card.flip
        @board.print_current

        if second_card.value != chosen_card.value
            chosen_card.flip
            second_card.flip
        else
            return true if self.win?
        end

        false
    end

    def win?
        @board.each do |row|
            return true if row.include?("??")  
        end
        false
    end
end

test = Game.new(2)
test.run