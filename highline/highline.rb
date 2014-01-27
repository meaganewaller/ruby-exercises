# simple CLI highline implementation 

module HighLine
  class CLI
    def yes_no?(question, options = {})
      print "#{question} [y/n] "
      values = { "y" => true, "yes" => true, "n" => false, "no" => false }
      values.default = true
      input = gets.chomp.downcase
      values[input]
    end

    def ask(question, options = {})
      puts "#{question} [default: #{options[:default]}]"
      reply = gets.chomp
      if reply.empty?
        options[:default]
      else
        reply
      end
      puts reply
    end
  end
end


