require_relative "code"

class Mastermind

    def initialize(len)
        @secret_code = Code.random(len)
    end
    
    def print_matches(code_ins)
        print code_ins.num_exact_matches(@secret_code)
        print code_ins.num_near_matches(@secret_code)
    end

    def ask_user_for_guess
        puts 'Enter a code'
        input = gets.chomp
        code1 = Code.from_string(input)
        puts print_matches(code1)

        code1 == @secret_code
    end
    

end