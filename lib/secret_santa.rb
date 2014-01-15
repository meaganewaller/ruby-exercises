require_relative 'person'

class SecretSanta
  def create_people_from_file(file)
    people = []
    IO.foreach(file) do |line|
      details = line.split
      first_name, last_name, email = details[0], details[1], details[2].delete('<>')
      people << Person.new(first_name, last_name, email)
    end
    people
  end
end
