class Assigner
  attr_reader :assignments, :santas

  def initialize(people)
    @people = people
    @assignments = []
  end

  def assign_santas
    @santas = @people.map do |person|
      { 
        :assignee => person,
        :assignment => assignment_for(person)
      }
    end
    if @assignments.include?(nil)
      @assignments = []
      assign_santas
    end
    return @santas
    return @assignments
  end


  private
  def assignment_for(person)
    assignment = (@people - [person] - @assignments).shuffle.first
    @assignments << assignment
    assignment
  end
end

require 'spec_helper'
require 'pry'
require 'pry-nav'

describe Assigner do
  let(:mike) { { :first_name => "Mike", :last_name => "Jansen", :email => "mike@8thlight.com" } }
  let(:meagan) { { :first_name => "Meagan", :last_name => "Waller", :email => "meagan@8thlight.com" } }
  let(:foo) { { :first_name => "Foo", :last_name => "Bar", :email => "foo@bar.com" } }

  it "assigns a secret santa given 2 people" do
    assigner = Assigner.new([mike, meagan]).assign_santas
  end

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
