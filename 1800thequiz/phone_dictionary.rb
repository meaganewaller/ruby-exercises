# The runtime for this is super duper awful. It takes multiple minutes to find a word match for the number string
# It prompts you for your 7 digit number, then it gets all the possibilties of letter combinations from the #all_possibilties method. This just returns a product of the NUMBER[num_string(0)] and NUMBER[num_string], so most of it is just complete gibberish.
# Next after it gets all the possibilties from it looks for words in the dictionary with the #words_in_dict method. This has an empty array called found, and for every word that actually exists in the dictionary it shovels it into the found array. 
# The way we check if a word actually exists is to set exists to false to start off with, then to open the DICT file (our dictionary) and read it. For each line if line.downcase.gsub if it equals our word, it exists. We then return true/false if it exists. This TAKES FOREVER, obviously.
#
# A more ideal solution might be one that searches like so:
# Doesn't look at words over 7 letters, or under 2 letters.
# Recursion might be a good way to look at this problem as well. Match numbers against the front of the phone number passing the matched words and what's left of the num_string down recursively until there is nothing left to match. Return an Array of chunks of the word, each chunk should be an array of all the words that can be used at that point. For example, a small part of the search results could start with a word, followed by a number: 
# [["user"]], ["8"], ["aw", "ax", "ay", "by"]],
# [["user"]], ["taw", "tax", "tay"]]
#
class PhoneDictionary

  DICT = "/usr/share/dict/words"

  NUMBERS = { 
    "1" => ["1"],
    "2" => ["a", "b", "c"],
    "3" => ["d" ,"e", "f"],
    "4" => ["g" ,"h", "i"],
    "5" => ["j", "k", "l"],
    "6" => ["m", "n", "o"],
    "7" => ["p", "q", "r", "s"],
    "8" => ["t", "u", "v"],
    "9" => ["w", "x", "y", "z"],
    "0" => ["0"]
  }

  def all_possibilities(num_string)
    # Randomizes the letters from the number string. 
    array = num_string.split("")
    first = array.delete_at(0)
    rest = array.map { |char| NUMBERS[char] }
    word_arrays = NUMBERS[first].product(*rest)
    word_arrays.map{ |char_array| char_array.join }
  end

  def words_in_dict(words)
    # Checks against all possibilities if the word is the in dictionary. This is really not a great implementation
    found = []
    words.each do |word|
      found << word if word_exists?(word)
    end
    found
  end

  def word_exists?(word)
    # Checks if the word exists in the dictionary
    exists = false
    File.open(DICT,'r') do |file|
      while(line = file.gets)
        if line.downcase.gsub(/\n/, '') == word.downcase
          exists = true
          break
        end
      end
    end
    exists
  end

  def words_for(num_string)
    # Returns the words for the number string
    all_words = all_possibilities(num_string)
    found_words = words_in_dict(all_words)
    found_words
  end
end

phone_dict = PhoneDictionary.new  
puts "Enter your 7 digit number "
user_input = gets.chomp
puts "Thinking..."
if phone_dict.words_for(user_input).empty?
  puts "No words for this number, sorry"
else
  puts phone_dict.words_for(user_input)
end
