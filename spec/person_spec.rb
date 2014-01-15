require 'spec_helper'
require './lib/person'

describe Person do
  meagan_details = { 
    "first_name" => "Meagan", 
    "last_name"  => "Waller", 
    "email"      => "meagan@something.com" 
  }

  lauren_details = { 
    "first_name" => "Lauren", 
    "last_name"  => "Waller", 
    "email"      => "lauren@something.com" 
  }

  bob_details = {
    "first_name" => "Bob",
    "last_name"  => "Smith",
    "email"      => "bob@something.com"
  }

  it "initializes with persons details" do
    person = Person.new(meagan_details)
    person.first_name.should == "Meagan"
    person.last_name.should == "Waller"
    person.email.should == "meagan@something.com"
  end

  it "return true if can be secret santa" do
    meagan = Person.new(meagan_details)
    bob = Person.new(bob_details)
    meagan.can_be_santa_for?(bob).should be_true
  end

  it "return false if can't be secret santa" do
    meagan = Person.new(meagan_details)
    lauren = Person.new(lauren_details)
    meagan.can_be_santa_for?(lauren).should be_false
  end

  it "prints name nicely" do
    meagan = Person.new(meagan_details)
    meagan.print_name.should == "Meagan Waller"
  end
end
