class Item

    attr_accessor :title, :description
    attr_reader :deadline
    def self.valid_date?(date_str)
        potential_date = date_str.split("-")
        potential_month = potential_date[1].to_i
        potential_day = potential_date[2].to_i
        (1..12).to_a.include?(potential_month) && (1..31).to_a.include?(potential_day)
    end

    def initialize(title, deadline, description)
        @title = title
        if Item.valid_date?(deadline)
            @deadline = deadline 
        else
            raise('invalid date')

        end
    
        @description = description
    end


    def deadline=(new_deadline)
        if Item.valid_date?(new_deadline) 
            @deadline = new_deadline
        else 
            raise ('invalid date')
        end
    end

    

end

input = Item.new('lunch with sarah', '2012-10-25', 'haha')
puts input