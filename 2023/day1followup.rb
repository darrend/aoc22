puts "22eightwotest3sevenine6three".scan(/(?=(1|2|3|4|5|6|7|8|9|one|two|three|four|five|six|seven|eight|nine))/).inspect
puts "22eightwotest3sevenine6three".scan(/.*(1|2|3|4|5|6|7|8|9|one|two|three|four|five|six|seven|eight|nine)/).inspect
puts "22eightwotest3sevenine6three".match(/.*(1|2|3|4|5|6|7|8|9|one|two|three|four|five|six|seven|eight|nine)/).inspect
puts "22eightwotest3sevenine6three".scan(/(1|2|3|4|5|6|7|8|9|one|two|three|four|five|six|seven|eight|nine).*/).inspect
puts "22eightwotest3sevenine6three".match(/(1|2|3|4|5|6|7|8|9|one|two|three|four|five|six|seven|eight|nine).*/).inspect


IV = {}
    .tap { |m| (0..9).each { |i| m[i.to_s] = i.to_s } }
    .tap { |m| %w[one two three four five six seven eight nine].each_with_index { |k,v| m[k] = (v + 1).to_s } }
    #.then { |m| [m, Regexp.union(m.keys)]}
RU = Regexp.union(IV.keys)
RF = /(#{RU}).*/
RL = /.*(#{RU})/

#puts [RF,RL].map { |r| IV.dig(r.match(target) { _1[1] } || "0") }.join.inspect

#puts R.inspect
target = "thisthat"
first = IV.dig(RF.match(target) { _1[1] } || "0")
puts first.inspect
last = IV.dig(RL.match(target) { _1[1] } || "0")
puts last.inspect
