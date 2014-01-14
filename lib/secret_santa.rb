class SecretSanta
  attr_accessor :first_name, :last_name, :email
  def initialize(file)
    file = File.read(file)
    parse_file(file)
  end

  def parse_file(file)
    file.each_line do |line|
      line.match(/(\S+)\s+(\S+)\s+<(.*)>/)
      first_name, last_name, email = $1, $2, $3
      get_full_name(first_name, last_name)
    end
  end

  def get_full_name(first, last)
    first + " " + last
  end
end

SecretSanta.new('./lib/secret_santa_file.txt')


