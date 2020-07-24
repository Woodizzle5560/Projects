
require "byebug"
class GuessingGame

    # attr_reader :num_attempts, :game_over 

    def initialize(min, max)
    
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false
    end
    
    def num_attempts
        @num_attempts
    end

    def game_over?
        @game_over 
    end

    def check_num(num)

        if num == @secret_num 
            @game_over = true
            puts 'you win' 
        elsif num > @secret_num
            puts 'too big'
            @num_attempts += 1
        else
            puts 'too small'
            @num_attempts += 1
        end
        num_attempts 
    end

    def ask_user
        p 'enter a number'
        @number = gets.chomp.to_i
        self.check_num(@number)
    end

end

g1 = GuessingGame.new(1, 10)

while !g1.game_over?

g1.ask_user

end
