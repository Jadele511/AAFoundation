class Hangman

  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end
  
  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    @attempted_chars.include?(char) ? true : false
  end

  def get_matching_indices(char)
    res = []
    @secret_word.each_char.with_index {|ch, i| res << i if ch == char }
    res
  end

  def fill_indices(char, indices)
    indices.each {|el| @guess_word[el] = char}
  end

  def try_guess(char)
    if already_attempted?(char)
      p 'that has already been attempted'
      return false
    else
      @attempted_chars << char 
      indices = get_matching_indices(char)
      if indices.length == 0
        @remaining_incorrect_guesses -= 1
      else
        fill_indices(char, indices)
      end
      return true     
    end
  end

  def ask_user_for_guess
    p 'Enter a char:'
    char = gets.chomp
    try_guess(char)
  end

  def win?
    if @guess_word.join('') == @secret_word
      p 'WIN'
      return true
    else
      p 'LOSE'
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p 'LOSE'
      return true
    else
      return false
    end
  end

  def game_over?
    if win? || lose?
      p "Secret word is #{@secret_word}"
      return true
    else
      return false
    end
  end
  
end
