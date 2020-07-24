# bundle exec rspec spec/code_spec.rb:44
class Board
 
    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n
    end

    def size 
        @size
    end

    def [](coordinates)
        @grid[coordinates[0]][coordinates[1]]
    end

    def []=(pos, val)
        @grid[pos[0]][pos[1]] = val
    end

    def num_ships
        @grid.flatten.count(:S)
    end

    def attack(position)
        
        if self[position] == :S
            self[position] = :H
            puts 'you sunk my battleship!'
            return true
        else
            self[position] = :X
            puts 'you missed!'
            return false
        end
    end

    def place_random_ships
        num_ships = self.size * 0.25
        while num_ships > 0
            x = rand(0...Math.sqrt(size))
            y = rand(0...Math.sqrt(size))
            if self[[x, y]] != :S
                self[[x, y]] = :S
                num_ships -= 1
            end
        end    
    end

    def hidden_ships_grid
    fake_grid = Array.new(@grid.length) {Array.new(@grid.length)} 
        fake_grid.each_with_index do |subarray, y|
            subarray.each_with_index do |ele, x|
                fake_grid[y][x] = @grid[y][x]
                    if fake_grid[y][x] == :S
                        fake_grid[y][x] = :N
                    end            
            end
        end
        fake_grid
    end

    def self.print_grid(grid)
        grid.each do |sub_arr|
            puts sub_arr.join(' ')
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print 
        Board.print_grid(self.hidden_ships_grid)
    end
    
end