class Person
  attr_accessor :first_name, :last_name, :email, :secret_santa

  def initialize(first_name, last_name, email)
    @first_name = first_name
    @last_name = last_name
    @email = email
  end

  def to_s
    "#{first_name} #{last_name}"
  end
end
