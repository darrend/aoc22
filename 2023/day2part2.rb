def weigh_game(game)
    result = parsegame(game)
    puts result.inspect
    result[:max].values.reduce(:*)
end

# Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
def parsegame(line)
    regex = /Game (\d+): (\d+ (?:red|green|blue))+/
    {
        game: line.scan(/Game (\d+)/).flatten.first.to_i,
        max: line.scan(/(\d+) (red|green|blue)/).each_with_object({}) { |(num,color), hash|
            num = num.to_i
            hash[color] = num if (hash[color]||0) < num
        }
    }
end

weight = 0

ARGF.each do |line|
    weight += weigh_game(line)
end
puts weight
