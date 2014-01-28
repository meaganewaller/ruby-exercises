# simple CLI highline implementation 

module HighLine
  class CLI
    # def ask(question, options=nil)
    #   begin
    #     # Starts off as valid
    #     valid = true

    #     # Gets default, and gets default string if default exists, otherwise ""
    #     default = option(options, :default)
    #     default_str = get_default_string(default)

    #     # When asking for integers this takes a number in either binary, octal, decimal or hexadecimal
    #     base = option(options, :base)

    #     # Print the question to the user, dsiplaying the default string
    #     print question, "#{default_str} "

    #     # Get the input, if no input, resort to default if it exists
    #     input = gets.chomp
    #     if default && input == ""
    #       input = default
    #     end
        
    #     # Convert the input to the correct type
    #     input = case type
    #             when :string: input
    #             when :integer: convert(input, base) rescue valid = false
    #             when :float: Float(input) rescue valid = false
    #             when :bool:
    #               valid = input =~ /^(y|n|yes|no)$/
    #               input[0] == ?y
    #             end

    #     # Validating the input
    #     valid &&= validate(options, :validate) { |value| input =~ value }
    #     valid &&= validate(options, :within) { |value| input > value }
    #     valid &&= validate(options, :above) { |value| input > value }
    #     valid &&= validate(options, :below) { |value| input < value }

    #     puts "Not a valid value" unless valid
    #     end until valid

    #     return input
    #   end
    # end

    # def get_default_string(default)
    #   if default
    #     " |#{default}|"
    #   else
    #     ""
    #   end
    # end

    def yes_no?(question, options = {})
      print "#{question} [y/n] "
      values = { "y" => true, "yes" => true, "n" => false, "no" => false }
      values.default = true
      input = gets.chomp.downcase
      values[input]
    end

    def ask(question, options = {})
      print "#{question} [default: #{options[:default]}] "
      input = gets.chomp
      if input.empty?
        options[:default]
      else
        input
      end
      puts input
    end
  end
end


