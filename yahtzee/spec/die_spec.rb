require 'spec_helper'
require './lib/die'

describe Die do
  it "rolls a die" do
    die = Die.new
    %w{1 2 3 4 5 6}.should include die.roll.to_s
  end
end
