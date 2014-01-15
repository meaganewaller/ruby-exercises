require 'spec_helper'
require './lib/person'

describe Person do
  it "initializes with persons details" do
    person = Person.new("Meagan", "Waller", "meagan@something.com")
    person.first_name.should == "Meagan"
    person.last_name.should == "Waller"
    person.email.should == "meagan@something.com"
  end

  it "prints name nicely" do
    person = Person.new("Meagan", "Waller", "meagan@waller.com")
    person.to_s.should == "Meagan Waller"
  end
end
