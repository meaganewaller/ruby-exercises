require_relative 'family'
class Assigner
  attr_accessor :people, :families

  def initialize(people)
    @people = people
    @families = create_families(people)
  end

  def create_families(people)
    family_name = people.map { |person| person.last_name }
    family_name.uniq!
    @families = family_name.map { |name| Family.new(name) }
  end
end
