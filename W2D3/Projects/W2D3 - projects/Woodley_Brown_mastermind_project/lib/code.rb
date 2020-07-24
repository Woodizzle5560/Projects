class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
 
  def self.valid_pegs?(arr)
    arr.all? {|char| POSSIBLE_PEGS.has_key?(char.upcase)} 
  end

  def initialize(arr)
    if !Code.valid_pegs?(arr)
      raise error 
    else
      @pegs = arr.map {|ch| ch.upcase }
    end
  end

  def pegs
    @pegs
  end

  def self.random(len)
    Code.new(Array.new(len) {POSSIBLE_PEGS.keys.sample})
  end

  def self.from_string(peg_str)
    Code.new(peg_str.split(""))
  end

  def [](idx)  
    @pegs[ idx ]
  end

  def length
    @pegs.length
  end
  
  def num_exact_matches(code_ins)
    counter = 0
    i = 0
    
    while i < code_ins.length

      if code_ins[ i ] == @pegs[ i ]
        counter += 1
      end

      i += 1
    end
    p "Number of exact matches: #{counter}"
  end

  def num_near_matches(code_guess)
    correct = 0
    i = 0
    while i < code_guess.length
      guess_peg = code_guess[i] 
        if @pegs.include?(guess_peg) && (self[i] != guess_peg)
          correct += 1
        end
      i += 1
    end
    p "Number of near matches: #{correct}"
  end

  def ==(other_code)

    if @pegs.length != other_code.length
      return false
    end

    i = 0
    while i < @pegs.length
      if @pegs[ i ] != other_code[ i ]
        return false
      end

      i += 1
    end

    true 
  end

end
