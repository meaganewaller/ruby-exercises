require 'spec_helper'
require './lib/assigner'
require './lib/person'
require './lib/secret_santa'

describe Assigner do

  # let(:meagan) { Person.new("Meagan", "Waller", "meagan@waller.com") }
  # let(:lauren) { Person.new("Lauren", "Waller", "lauren@waller.com") }
  # let(:riley) { Person.new("Riley", "Radoll", "riley@radoll.com") }
  # let(:sarah) { Person.new("Sarah", "Smith", "sarah@smith.com")}
  # let(:charles) { Person.new("Charles", "Miner", "charles@miner.com")}
  
  let(:people) { SecretSanta.new.create_people_from_file("./spec/test_file.txt") }
  let(:assigner) { Assigner.new(people) }


  it "creates families properly" do
    families = assigner.families
    families[0].name.should == "Waller"
    families[1].name.should == "Radoll"
    families[2].name.should == "Smith"
    families[3].name.should == "Miner"
    families[4].name.should == "Halpert"
    families[5].name.should == "Schrute"
  end
  
end
