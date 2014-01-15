require 'spec_helper'
require './lib/assigner'
require './lib/person'
require './lib/secret_santa'

describe Assigner do

   let(:meagan) { Person.new("Meagan", "Waller", "meagan@waller.com") }
   let(:lauren) { Person.new("Lauren", "Waller", "lauren@waller.com") }
   let(:riley) { Person.new("Riley", "Radoll", "riley@radoll.com") }
   let(:sarah) { Person.new("Sarah", "Smith", "sarah@smith.com")}
   let(:charles) { Person.new("Charles", "Miner", "charles@miner.com")}
  
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

  it "has family size" do
    families = assigner.families
    families[0].size.should == 2
    families[1].size.should == 1
  end

  it "returns true if people are in the same family" do
    assigner.same_family?(meagan, lauren).should be_true
  end

  it "returns false if people aren't in the same family" do
    assigner.same_family?(meagan, riley).should be_false
  end

  it "finds families by their name" do
   family = assigner.find_family_by_name("Waller")
   family.name.should == "Waller"
   family.size.should == 2
    
  end
end
