def proper_factors(num)
    new_array = []

    (1...num).each do |factor|
        if (num % factor) == 0
            new_array << factor
        end
    end
    
    new_array
end

def aliquot_sum(num)
    proper_factors(num).sum
end 

def perfect_number?(n)
    aliquot_sum(n) == n
end
#ideal_numbers(2)).to eq([6, 28]
def ideal_numbers(n)
    count = 0
    return_arr = []
    i = 1
    while count <= n
        if perfect_number?(i)
            count += 1 
            return_arr << i
            if count == n
                return return_arr
            end
        end
        i += 1
    end
end