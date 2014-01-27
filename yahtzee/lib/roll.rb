module Yahtzee
  class Roll
    attr_reader :dice
    def initialize
      @dice = Array.new(5) { rand(6) + 1 }
    end
  end
end


