class Random
  def correct_match?( givers, receivers )
    receivers.each_with_index do |receiver, index|
      return false if receiver.last_name == givers[index].last_name
    end
    return true
  end

  players = ARGF.read.split("\n")

  begin
    santas = players.sort_by { rand }
  end until correct_match?(santas, players)

  santas.each_with_index do |santa, index|
    puts "#{players[index]} -> #{santa}"
  end
end
