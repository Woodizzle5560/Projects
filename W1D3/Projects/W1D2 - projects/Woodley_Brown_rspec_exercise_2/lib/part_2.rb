require "byebug"
def palindrome?(str)
    backword = ''

    i = str.length - 1

    while i >= 0

        backword += str[ i ]
        i -= 1

    end

    backword == str # true or false
end

def substrings(str)
    #Outer Loop with idx - idx = 0, selecting ele 0, 
    #Innerloop with idx - to add remaining elements in pairs to new array
    #pair = ele 0 + ele 1
    #return new array after outer loop finishes 
    #  debugger
    new_arr = []
    
    str.each_char.with_index do |char, idx| 
        seq = char 
        new_arr << char
        i = (idx + 1) 

        while i <= str.length - 1
            char2 = str[i]  
            seq = (seq + char2)   
            new_arr << seq
            i += 1
        end
        # if !new_arr.include?(str)
        #     new_arr << str
        # end
    end

    new_arr
end

p substrings("jump")

#"j", "ju", "jum", "jump", "m", "mp", "p", "u", "um", "ump"]

# ["j", "ju", "jum", "jump", "m", "p", "u", "um"]


def palindrome_substrings(str)
    palin_subs = []

    substrings(str).each do |sub_str|
        if palindrome?(sub_str) && sub_str.length > 1
            palin_subs << sub_str
        end
    end

    palin_subs
end


