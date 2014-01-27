require 'spec_helper'
require './lib/roll'

describe "Roll" do
  it "rolls 5 dice" do
    roll = Yahtzee::Roll.new
    roll.dice.size.should == 5
  end
end
