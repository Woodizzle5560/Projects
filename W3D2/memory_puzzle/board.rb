require_relative "./cards.rb"
class Board

    attr_reader :grid, :size
    
    def initialize(n)
        @grid = Array.new(n) {Array.new(n, "??")}
        @size = n * n
        self.fill_grid
    end

    def print_complete
        (0...self.grid.length).each do |i| 
            print "   " if i == 0
            (print i.to_s + "   ")
        end
        puts ""

       self.grid.each_with_index do |row, idx|
            arr = []
            row.each do |ele|
              arr << ele.value.to_s
            end
            puts "#{idx}  " + arr.join("  ")
        end
    end

    def print_current
        (0...self.grid.length).each do |i| 
            print "   " if i == 0
            (print i.to_s + "   ")
        end
        puts ""

       self.grid.each_with_index do |row, idx|
            arr = []
            row.each do |ele|
                if ele.face_up
                    arr << ele.value.to_s
                else 
                    arr << "??"
                end
            end
            puts "#{idx}  " + arr.join("  ")
        end
    end


    def []=(pos, value)
        row, col = pos
        @grid[row][col] = value
    end

    def [](pos)
        row = pos[0]
        col = pos[1]
        @grid[row][col]
    end

    def fill_grid
        i = 0
        while i <= @size - 1
            new_card = Card.get_random_card
            pos = self.get_random_pos 
            if self[pos] == "??" && !has_card?(new_card)
                self[pos] = new_card
                self.dup_card_fill(new_card)
                i += 2
            end
        end
    end

    def get_random_pos
      rand_1 =  rand(0...@grid.length)
      rand_2 =  rand(0...@grid.length)
      pos = [rand_1, rand_2]
    end
 #we should keep working at this 
    def dup_card_fill(card)
        i = 0
        while i < 1
            pos = self.get_random_pos    
            if self[pos] == "??"
                i += 1
                self[pos] = card
            end 
        end
    end

    def has_card?(card)
        @grid.each {|row| return true if row.include?(card)}
        false
    end

end  


