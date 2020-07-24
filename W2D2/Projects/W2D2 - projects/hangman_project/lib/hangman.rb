require "byebug"
class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

    # attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses 

    def self.random_word
      DICTIONARY.sample
    end 

    def initialize
      @secret_word = Hangman.random_word
      @guess_word = Array.new(@secret_word.length, "_") 
      @attempted_chars = []
      @remaining_incorrect_guesses = 5
    end 

    def guess_word
      @guess_word
    end 

    def attempted_chars
      @attempted_chars
    end 

    def remaining_incorrect_guesses
      @remaining_incorrect_guesses
    end 

    def already_attempted?(char)
        return self.attempted_chars.include?(char) ? true : false 
    end 

    def get_matching_indices(char)
      secret_idx = []
         @secret_word.each_char.with_index do |ch, idx|
              if ch == char 
                 secret_idx << idx 
              end 
         end 
         secret_idx 
    end 


    def fill_indices(char, indices)  
       indices.each do |slot| 
           @guess_word[slot] = char   
       end 
    end 

    def try_guess(char)
      attempted = self.already_attempted?(char)
      pass = false

      if attempted
        puts 'that has already been attempted'
      else
        @attempted_chars << char
        pass = true  
      end

      matching_indices = self.get_matching_indices(char)
      if matching_indices.empty?
        @remaining_incorrect_guesses -= 1
      end

      self.fill_indices(char, matching_indices)
      pass
    end

    def ask_user_for_guess

    end
    
end


