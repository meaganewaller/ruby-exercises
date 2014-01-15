class Person
  attr_accessor :first_name, :last_name, :email, :secret_santa

  def initialize(details)
    @first_name = details["first_name"]
    @last_name  = details["last_name"]
    @email      = details["email"]
  end

  def can_be_santa_for?(person)
    last_name != person.last_name
  end

  def print_name
    "#{first_name} #{last_name}"
  end
end
