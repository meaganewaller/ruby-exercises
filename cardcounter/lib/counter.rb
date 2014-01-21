# Knock-Out System of Card Counting
# Start your count at 4 - (4 x number_of_decks)
# Example: 1 deck of cards start count at 0 / 2 decks of card start count at -4 / 8 decks of cards start at -28
# From there you: 
# Add one each time you see a 2, 3, 4, 5, 6, or 7
# Subtract one each time you see a 10, jack, queen, king or ace
# The 8 and 9 cards do not affect the count 
# Once you learn to track the running count you can make strategy decisions and vary your bets based on the times when the count is in your favor.
#
# This program needs to show you one or more cards at a time, running through a Blackjack shoe. As it goes the program should track the running count. Have it pause at random intervals, ask you the count and notify you if you are right or wrong. 
#
# Both the time to go through the deck and the number of cards displayed at a time should be configurable. It's important to practice with seeing multiple cards at once because you learn to cancel out pairs of high and low cards. It might even be nice to provide a mixed mode, which varies the number of cards shown at a time.
#

# The card counter
#

CARDS = %w{A K Q J T 9 8 7 6 5 4 3 2}
SUITS = %w{s h d c}

class Counter
  attr_accessor :shoe, :count, :size
  
  def initialize(number_of_decks)
    @count = 4 - (4 * number_of_decks)
    @size = 52 * number_of_decks
    populate_decks(number_of_decks)
    shuffle_cards
  end

  def populate_decks(number_of_decks)
    @shoe = []
    number_of_decks.times do
      CARDS.each do |card|
        SUITS.each do |suit|
          @shoe << card.to_s + suit.to_s
        end
      end
    end
  end

  def shuffle_cards
    @size.times do |i|
      shuffled = rand(@size)
      @shoe[i], @shoe[shuffled] = @shoe[shuffled], @shoe[i]
    end
  end

  def deal
    card = @shoe.pop
    @count += 1 if "234567".include? card[0,1].to_s
    @count -= 1 if "TJQKA".include? card[0,1].to_s
    card
  end

  def size
    @shoe.size
  end
end


