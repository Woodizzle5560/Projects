require "byebug"

def my_reject(arr, &prc)
    new_arr = []

    arr.each do |ele|
        if !prc.call( ele ) 
            new_arr << ele
        end

    end

    new_arr
end

#array.one? 
def my_one?(arr, &prc)
    counter = 0
    # [e1,e2,e3]
    arr.each do |ele|

        if proc.call( ele )
            counter += 1
        end
            
    end  
     counter == 1
end

# def hash_select(hash, &prc)
#     return_hash = {}
#     #  expect(hash_select({"a"=>0, "b"=>1, "c"=> 2, "o"=>14}) { |k, v| "aeiou".include?(k) }).to eq({"a"=>0, "o"=>14})
#     #   expect(hash_select({"a"=>0, "b"=>1, "c"=> 2, "o"=>14}) { |k, v| v.even? }).to eq({"a"=>0, "c"=> 2, "o"=>14})
#     hash.each_key do |k|
#         if prc.call(& )
#             return_hash[k] = v 
#         end
#     end 
#     return_hash
# end

def hash_select(hash, &prc)
    #debugger
    return_hash = {}
    hash.each do |k, v|
        if prc.call(k, v)
            return_hash[k] = v 
        end
    end 
    return_hash
end

#xor_select([2, 5, 3, 7, 6, -8, -1], even, positive))
def xor_select(arr, prc1, prc2)
    new_arr = []
    arr.each do |ele|
        if !prc1.call(ele) && prc2.call(ele)
            new_arr << ele    
        elsif prc1.call(ele) && !prc2.call(ele)
            new_arr << ele 
        end
    end
    new_arr
end

def proc_count(value, arr)
    count = 0
    arr.each do |ele|
        if ele.call(value)
            count += 1
        end
    end
    count
end

