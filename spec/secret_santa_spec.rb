require 'spec_helper'
require './lib/secret_santa'

describe SecretSanta do
  let(:file) { "./spec/test_file.txt" }

  let(:santa) { SecretSanta.new }

  it "loads people from file" do
    @people =  santa.create_people_from_file(file)
    @people[0].first_name.should == "Meagan"
    @people[0].last_name.should == "Waller"
    @people[0].email.should == "meagan@waller.com"
  end
end

