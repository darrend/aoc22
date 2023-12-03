# after reading how others did it their realization that you just need the number that occurs first
# and the number that occurs last inspired me to see what that would look like
#

def match(regex, target)
   regex&.match(target) { _1[1]}
end

def part1(target)
  [/(\d).*/, /.*(\d)/].map { |r| match(r,target)||"0" }.join.to_i
end

IV = {}
    .tap { |m| (0..9).map(&:to_s).each { |i| m[i] = i } }
    .tap { |m| %w[zero one two three four five six seven eight nine].each_with_index { |k,v| m[k] = v.to_s } }
RU = Regexp.union(IV.keys)
RF = /(#{RU}).*/
RL = /.*(#{RU})/

def part2(target)
    [RF,RL].map { |r| IV.dig(match(r,target)||"0") }.join.to_i
end

puts ARGF.inject([0,0]) { |(p1,p2),l| [p1+part1(l), p2+part2(l)] }
