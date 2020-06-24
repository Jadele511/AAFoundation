class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(chars)
    chars.all? {|char| POSSIBLE_PEGS.include?(char.upcase)}
  end

  def self.random(n)
    pegs = []
    n.times { pegs << POSSIBLE_PEGS.keys.sample}
    Code.new(pegs)
  end

  def self.from_string(pegs)
    Code.new(pegs.split(''))
  end

  def initialize(chars)
    if !Code.valid_pegs?(chars)
      raise 'invalid pegs'
    else
      @pegs = chars.map(&:upcase)
    end
  end

  def [](idx)
    @pegs[idx]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    @pegs.each_index.count {|i| @pegs[i] == guess[i]}
  end

  def num_near_matches(guess)
    @pegs.each_index.count {|i| @pegs.include?(guess[i]) && @pegs[i] != guess[i]}
  end

  def ==(other_pegs)
    self.pegs == other_pegs.pegs
  end



end
