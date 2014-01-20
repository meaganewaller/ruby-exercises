require 'spec_helper'
require 'pry'
require 'pry-nav'

class Person
  attr_reader :first_name, :last_name, :email
  attr_accessor :santa
  
  def initialize(line)
    person = line.split
    @first_name = person[0]
    @last_name = person[1]
    @email = person[2].delete("<>")
    @santa = ""
  end

  def can_be_santa_of?(person)
    @last_name != person.last_name
  end
end

class Assigner
  def initialize(people)
    @people = people
    @assignments = []
  end

  def assign_santas
    @people.map do |person|
      { 
        :assignee => person,
        :assignment => assignment_for(person)
      }
    end
  end


  private
  def assignment_for(person)
    assignment = (@people - [person] - @assignments).shuffle.first
    @assignments << assignment
    assignment
  end

  def everyone_has_assignment
    @assignments.size == @people.size
  end
end

describe Person do
  it "person has first last and email" do
    person = Person.new("Mike Jansen <mike@8thlight.com>")
    person.first_name.should == "Mike"
    person.last_name.should == "Jansen"
    person.email.should == "mike@8thlight.com"
  end

  it "knows who it can be santa too" do
    meagan = Person.new("Meagan Waller <meagan@8thlight.com>")
    lauren = Person.new("Lauren Waller <lauren@gmail.com>")
    mike = Person.new("Mike Jansen <mike@8thlight.com>")
    meagan.can_be_santa_of?(lauren).should be_false
    mike.can_be_santa_of?(meagan).should be_true
  end
end

describe Assigner do
  let(:mike) { { :first_name => "Mike", :last_name => "Jansen", :email => "mike@8thlight.com" } }
  let(:meagan) { { :first_name => "Meagan", :last_name => "Waller", :email => "meagan@8thlight.com" } }
  let(:foo) { { :first_name => "Foo", :last_name => "Bar", :email => "foo@bar.com" } }

  def assignment_for(assignments, assignee)
    assignments.find { |a| a[:assignee] == assignee }[:assignment]
  end

  def assert_assigments_are_unique(assignments)
    assignees = assignments.map { |a| a[:assignee] }
    assignments = assignments.map { |a| a[:assignment] }
    
    assignments.uniq.size.should == 3
    assignees.should =~ assignments
  end

  it "assigns secret santas given 2 people" do
    assignments = Assigner.new([mike, meagan]).assign_santas

    assignment_for(assignments, mike).should == meagan
    assignment_for(assignments, meagan).should == mike
  end

  it "assigns secret santas given 3 people" do
    assignments = Assigner.new([mike, meagan, foo]).assign_santas

    [meagan, foo].should include(assignment_for(assignments, mike))
    [foo, mike].should include(assignment_for(assignments, meagan))
    [mike, meagan].should include(assignment_for(assignments, foo))

  end

  it "ensures that assignments are unique" do
    10.times do 
      assignments = Assigner.new([mike, meagan, foo]).assign_santas
      assert_assigments_are_unique(assignments)
    end
  end
end
