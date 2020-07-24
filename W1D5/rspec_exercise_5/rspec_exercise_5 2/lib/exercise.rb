require 'byebug'

def zip(*arr)
    arr.transpose
end


def prizz_proc(arr, prc1, prc2)
    result = []

    arr.each do |ele|
        result << ele if prc1.call( ele ) != prc2.call( ele )
    end

    result 
end

# array_1 = ['a', 'b', 'c'] 
# array_2 = [1, 2, 3]
# array_3 = [11, 13, 15, 17] #[]
def zany_zip(*arr) 
    longest_arr = arr.max { |a, b| a.length <=> b.length }
    result = Array.new(longest_arr.length) {Array.new(arr.length)}
    # debugger
    longest_arr.each_with_index do |ele, idx| 
        arr.each_with_index do |sub_arr, sub_arr_idx|
            # debugger
            result[idx][sub_arr_idx] = sub_arr[idx]
        end
    end
    result
end
# zany_zip(array_3, array_2, array_1)

def maximum(arr, &block)
    return nil if arr.empty? 
    largest = 0
    largest_idx = 0
    arr.each_with_index do |ele, idx|
        result = block.call(ele)
        if result >= largest
            largest = result
            largest_idx = idx
        end
    end
    arr[largest_idx]
end

def maximum(arr, &block)
    return nil if arr.empty? 
    arr.inject do |accum, ele| 
         if block.call(ele) >= block.call(accum)
            ele
         else
            accum
         end
    end
end


#Inject

# sum = 0

# (0...arr.length).each {|i| sum += arr[ i ] }

# maximum([2, 4, -5, 1]) { |n| n * n }


#Input: Arr & Block 
#Pass ele from arr into block
#Use results from block as keys to build new hash.
#Fill in hash values with array of all results of arr

def my_group_by(arr, &block)
    result = {}
    # test = Hash.new {|hash, key| hash[key] = arr.select {|ele| block.call(ele)}} 
    arr.each do |ele| 
        if result[ block.call(ele) ] == nil 
            callResult = block.call(ele)
            result[ callResult ] = arr.select {|ele| block.call(ele) == callResult}
        end 
    end
    result 
end

# def my_group_by(arr, &block)
#     result = {}

#     arr.each do |ele| 
#         if result[ ele ] == nil 
#             callResult = block.call(ele)
#             result[ callResult ] = [ ele ] 
#         end 
#     end

#     arr.each do |ele|
#         len = ele.length
#         result.each do |k, v|
#             if k.length == len
#                 result 
#             end
#         end
#     end

#     result 
# end


def max_tie_breaker(arr, proc, &block)
    return nil if arr.empty? 

    arr.inject do |accum, ele| 
         if block.call(ele) > block.call(accum)
            ele
         elsif block.call(ele) == block.call(accum)
             proc.call(ele) > proc.call(accum) ? ele : accum
         else
            accum
         end
    end
end


# (0..arr.length).step(2) { }
# condition x == y ? first_return : 

# do this if bla bla else bla bla bla else 
# do this unless bla bla  #ask TA if there can be ELSE
# def max_tie_breaker(arr, proc, &block)

# return nil if arr.empty? 
#     largest = 0
#     largest_idx = 0
#     arr.each_with_index do |ele, idx|
#         result = block.call(ele)
#         if result >= largest
#             largest = result
#             largest_idx = idx
#         elsif proc.call( result ) > proc.call( larget )

#         end
#     end
#     arr[largest_idx]
# end


def remove_vowels(word)
    vowels = 'aeiou'
    new_word = ''
    debugger
    word.each_char.with_index do |char, i|
        if vowels.include?(char)
            new_word = word[i..-1]
            break
        end
    end
    debugger
    new_word.reverse.each_char.with_index do |char,i|
        if vowels.include?(char)
            new_word = new_word[i..-1]
            debugger
            break
        end
    end
    new_word
end
remove_vowels("bakako")

# def silly_syllables(sent)
#     words = sent.split
#     new_sent =[]
#     words.each do |word|
#         new_sent << remove_vowels(word)
#     end
    
#     new_sent.join(" ")
# end

