class PhoneDictionary

  def initialize(dictionary)
    @words = Hash.new { |dict, digits| dict[digits] = Array.new }
    create_words_hash
    read_dictionary(dictionary)
  end

  def create_words_hash
    ("0".."9").each { |n| @words[n] << n }
  end

  def read_dictionary(dictionary)
    File.foreach(dictionary) do |word|
      normalize_words(word)
      if appropriate_word(word)
        letters = get_letters_from_word(word)
        digits = get_digits_from_letters(letters)
        add_to_word_hash(digits, word)
      end
    end
  end

  def appropriate_word(word)
    !word.empty? && word.size > 2 && word.size < 7
  end

  def get_letters_from_word(word)
    word.split(//)
  end

  def get_digits_from_letters(letters)
    letters.map { |l| encode(l) }.join
  end

  def add_to_word_hash(digits, word)
    @words[digits] << word unless @words[digits].include?(word)
  end

  def normalize_words(word)
    word.downcase!
    word.delete("^a-z")
  end

  # This is our runner, it does the searching, converts the results to strings gets rid of bad
  # results and returns our results sorted for us.
  def number_to_words(number_string)
    results = search(number_string)
    results.map! { |word_chunks| word_chunks_to_strings(word_chunks) }.flatten
    results.reject! { |words| words =~ /\d-\d/ }
    results.sort!
  end

  # Recursive method, pass the matched words & what's left of the number string 
  # until there is nothing left to match
  def search(number, word_chunks = Array.new)
    @words.inject(Array.new) do |all, (digits, words)|
      if remaining = match(number, digits)
        new_chunks = (word_chunks.dup << words)
        if remaining.empty? # Exit condition, once this is reached we don't search anymore.
          all << new_chunks
        else
          all.push(*search(remaining, new_chunks))
        end
      else
        all
      end
    end
  end
  
  def match(number, digits)
    if number[0, digits.length] == digits
      number[digits.length..-1]
    else
      nil
    end
  end

  # Take a single word chunk and combine it with all combos/ once we reach the final 
  # word group (new_chunks.empty?) we exit. 
  def word_chunks_to_strings(word_chunks)
    word_chunk, *new_chunks = word_chunks.dup
    if new_chunks.empty?
      word_chunk.map { |word| word.upcase }
    else
      word_chunk.map do |word|
        word_chunks_to_strings(new_chunks).map { |words| "#{word.upcase}-#{words}"}
      end.flatten
    end
  end

  def encode(letter)
    case letter.downcase
    when "a", "b", "c"      then "2"
    when "d", "e", "f"      then "3"
    when "g", "h", "i"      then "4"
    when "j", "k", "l"      then "5"
    when "m", "n", "o"      then "6"
    when "p", "q", "r", "s" then "7"
    when "t", "u", "v"      then "8"
    when "w", "x", "y", "z" then "9"
    end
  end
end

# Running the program:
# $ ruby phone_dictionary.rb
# You'll be prompted to enter the phone number, enter the number and watch the results roll in.
# This one is way quicker than my last implementation. 
dictionary = if ARGV.first == "-d"
               ARGV.shift
               PhoneDictionary.new(ARGV.shift)
             else
               PhoneDictionary.new("/usr/share/dict/words")
             end
puts "Enter a 7 digit phone number "
user_input = gets.chomp.delete("^0-9")
puts dictionary.number_to_words(user_input)
