class Die
  attr_reader :num

  def initialize
    roll
  end

  def roll
    @num = rand(6) + 1
  end

  def to_s
    @num
  end
end
