require 'spec_helper'
require './lib/counter'

describe Counter do
  it "initializes with a number of decks" do
    counter = Counter.new(1)
    counter.shoe.size.should == 52
  end

  it "removes a card once its been dealt" do
    counter = Counter.new(1)
    counter.deal
    counter.shoe.size.should == 51
  end

  it "keeps track of the score" do
    counter = Counter.new(1)
    counter.shoe = [ '2h', 'Kd', '6s', '2c' ]
    counter.deal
    counter.count.should == 1
    counter.deal
    counter.count.should == 2
    counter.deal
    counter.count.should == 1
    counter.deal
    counter.count.should == 2
  end

  it "keeps track of the shoe size" do
    counter = Counter.new(1)
    counter.size.should == 52
    counter.deal
    counter.deal
    counter.deal
    counter.size.should == 49
  end
end
