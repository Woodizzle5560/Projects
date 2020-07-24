def hipsterfy(word)
    vowels = "aeiouAEIOU"
    word.reverse!
    word.each_char.with_index do |char, idx|
        if vowels.include?(char)
            without = word[0...idx]
            without2 = word[(idx + 1)..-1]
            return (without + without2).reverse
        end
    end
    word.reverse
end


def vowel_counts(str)
    str.downcase!
    my_hash = Hash.new(0) 
    vowels = 'aeiou'

    str.each_char do |char|

        if vowels.include?(char)
            my_hash[ char ] += 1
        end

    end

    my_hash
end

def caesar_cipher(string, num)
    alpha = "abcdefghijklmnopqrstuvwxyz"
    new_str = ""
    string.each_char do |char|
        if alpha.include?(char)
            new_idx = (alpha.index(char) + num) % alpha.length
            new_char = alpha[new_idx]
            new_str += new_char 
        else
            new_str += char
        end
    end
    new_str
end


