require_relative "./Item.rb"

class List

    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description='')
        new_item = Item.new(title, deadline, description)

        if Item.valid_date?(new_item.deadline)
            @items << new_item
            return true
        else 
            return false
        end

    end

    def size
        @items.length
    end

    def valid_index?(idx)
        idx >= 0 && idx < self.size #Ask TA
    end
    
    def swap(index_1, index_2)
        if !self.valid_index?(index_1) || !self.valid_index?(index_2)
            return false
        end
        @items[index_2], @items[index_1] = @items[index_1], @items[index_2]
        true
    end

    def [](index)
        if !self.valid_index?(index)
            return nil
        else
            return @items[index]
        end
    end

    def priority
        @items[0]
    end

    def print
        puts "-----------------------------------------"
        puts "#{self.label}".center(41)
        puts "-----------------------------------------"
        puts "Index | Item                   | Deadline"
        puts "-----------------------------------------"
        enumerate_items
        puts "-----------------------------------------"
    end

    def enumerate_items
        @items.each_with_index do |item, idx|
            x = (41 - (7 + 11)) - item.title.length 
            spaces = (' ' * x)
            puts "#{idx}" + "     " + "| #{item.title}" + spaces +  "| #{item.deadline}"
        end
    end

    def print_full_item(idx)
        #item
        puts "-----------------------------------------"
        x = (41 - (@items[idx].title.length + @items[idx].deadline.length))
        spaces = (' ' * x)

        puts "#{@items[idx].title}" + spaces +  " #{@items[idx].deadline}"
        puts "-----------------------------------------"    
    end

    def up(index, amount = 1) 
        i = 0 
        while i < amount
            next_index = index - 1 
            self.swap(index, next_index)
            index -= 1
            i += 1
        end
    end

    def down(index, amount = 1)
        i = 0
        while i < amount
            next_index = index + 1 
            self.swap(index, next_index)
            index += 1
            i += 1
        end
    end
    
    def sort_by_date!
        @items.sort_by!{|item| item.deadline}
    end
    

end
