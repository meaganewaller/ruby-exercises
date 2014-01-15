require 'spec_helper'
require './lib/person'

describe Person do
  meagan_details = { 
    "first_name" => "Meagan", 
    "last_name"  => "Waller", 
    "email"      => "meagan@something.com" 
  }

  it "initializes with persons details" do
    person = Person.new(meagan_details)
    person.first_name.should == "Meagan"
    person.last_name.should == "Waller"
    person.email.should == "meagan@something.com"
  end

  it "prints name nicely" do
    meagan = Person.new(meagan_details)
    bob = Person.new(bob_details)
    meagan.to_s.should == "Meagan Waller"
  end
end
