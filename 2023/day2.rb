def weigh_game(limits, game)
    result = parsegame(game)
    invalid = limits.detect { |color, max|
        max < (result[:max][color]||0)
    }
    invalid ? 0 : result[:game]
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
#  12 red cubes, 13 green cubes, and 14 blue cubes
limits = {"red" => 12, "green" => 13, "blue" => 14}
ARGF.each do |line|
    weight += weigh_game(limits, line)
end
puts weight
