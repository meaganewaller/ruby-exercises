require_relative 'family'
class Assigner
  attr_accessor :people, :families

  def initialize(people)
    @people = people
    @families = create_families(people)
  end

  def create_families(people)
    families = group_families_by_name(people)
    get_families_size(people, families)
  end

  def group_families_by_name(people)
    family_name = people.map { |person| person.last_name }
    family_name.uniq!
    @families = family_name.map { |name| Family.new(name) }
  end

  def get_families_size(people, families)
    families.each do |family|
      family.size = people.count { |person| person.last_name == family.name }
    end
  end

  def same_family?(first_person, second_person)
    first_person.last_name == second_person.last_name
  end
end
