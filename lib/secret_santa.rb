class SecretSanta
  attr_accessor :first_name, :last_name, :email
  def initialize(file)
    file = File.read(file)
    parse_file(file)
  end

  def parse_file(file)
    file.each_line do |line|
      first_name, last_name, email = line.scan(/(\S+)\s+(\S+)\s+<(.*)>/).flatten
      return first_name, last_name, email
    end
  end

  def parse_list(list)
    new_list = []
    list.each { |line| new_list << parse_list(line) }
    return new_list
  end

  def choose_secret_santa(first_name, last_name, list)
    santa = list.find_all { |first, last| last != last_name && name != name }.pop 
    list.delete(santa)
    return santa
  end
end

SecretSanta.new('./lib/secret_santa_file.txt')


