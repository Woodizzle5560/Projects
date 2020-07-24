def partition(arr, num_1)
    sub1 = []
    sub2 = []
    finalArr = []

    arr.each do |n|

        if n < num_1
            sub1 << n 
        else  
            sub2 << n
        end

    end

    finalArr.push(sub1, sub2)
end

def merge(hash_1, hash_2)
    new_hash = {}
    
    hash_1.each_key do |k|
        val1 = hash_1[k]
        new_hash[k] = val1
    end
    hash_2.each_key do |key|
        val2 = hash_2[key]
        new_hash[key] = val2
    end

    new_hash
end


# expect(censor("Gosh darn it", ["gosh", "darn", "shoot"])) = "G*sh d*rn it"

def censor(sentence, array)
words = sentence.split(/ /) #['Gosh', 'darn', 'it']
new_sent = "" 

words.each do |word| 
    if array.include?(word.downcase) 
        new_sent += r_vowels(word) + " " 
    else
        new_sent += word + " "
    end
end
    new_sent.strip!
end

def r_vowels(word) #'darn'
    vowels = "aeiouAEIOU"

    word.each_char.with_index do |char, idx|
        if vowels.include?(char)
            word[idx] = "*"
        end
    end
    word #'d*rn'
end



def power_of_two?(num)
    if num == 1
        return true
    end
    power = 2
    (0..num).each do 
       power *= 2
       if power == num
        return true
       end
    end
    
    return false
end


#As soon as we hung up for lunch I thought of it. 

#Other way:

# def censor(sentence, array)
# words = sentence.split(/ /) #['Gosh', 'darn', 'it']

# words.map do |word| 

#     if array.include?(word.downcase) 
#         r_vowels(word)
#     else
#         word
#     end

# end
#     words.join(' ')
# end

# def r_vowels(word) 
#     vowels = "aeiouAEIOU"

#     word.each_char.with_index do |char, idx|
#         if vowels.include?(char)
#             word[idx] = "*"
#         end
#     end
#     word 
# end