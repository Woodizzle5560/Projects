require_relative './List.rb'
class TodoBoard
    def initialize(label)
        @list = List.new(label)
    end  
    
    def get_command
        puts "\nEnter a command: "
        input = gets.chomp.split(/ /) #=> ['mktodo', ' ']
        print input
        cmd, *args = input
        
        case cmd
        when 'mktodo'
            @list.add_item(*args)
        when 'up'
            @list.up(args[0], args[1])
        when 'down'
            @list.down(args[0], args[1])
        when 'swap'
        when 'sort'
        when 'priority'
        when 'print'
        when 'quit'
            return false
        else
            print "Sorry, that command is not recognized."
        end

        true    
    end
end
