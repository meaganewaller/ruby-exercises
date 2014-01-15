class Person
  attr_accessor :first_name, :last_name, :email, :secret_santa

  def initialize(details)
    self.first_name = details["first_name"]
    self.last_name  = details["last_name"]
    self.email      = details["email"]
  end

  def can_be_santa_for?(person)
    last_name != person.last_name
  end

  def to_s
    "#{first_name} #{last_name}"
  end

  def with_secret_santa
    "#{self} - secret santa: #{secret_santa}"
  end
end
