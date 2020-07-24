def average(n1, n2)
    (n1 + n2) / 2.0
end

def average_array(arr)
    (arr.inject { |sum, el| sum + el } / arr.length.to_f)
end

def repeat(str, num)
    new_str = ""
    num.times {new_str += str}
    new_str
end

def yell (str)
    str.upcase + "!"
end

def alternating_case(str)
    parts = str.split(/ /)

    parts.each_with_index do |word, idx|

        if idx.even?
            parts[ idx ] = word.upcase
        else
            parts[ idx ] = word.downcase
        end

    end

    parts.join(' ')
end

