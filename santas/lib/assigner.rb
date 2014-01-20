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
    (0..@santas.size - 1).each do |num|
      if @santas[num][:assignee][:last_name] == @santas[num][:assignment][:last_name]
        assign_santas
      end
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
