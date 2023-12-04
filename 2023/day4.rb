#Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
def weigh(input)
  needle, haystack = input.split(":").last.split(" | ").collect { _1.scan(/\d+/) }
  found = needle.intersection(haystack).size
  found == 0 ? 0 : 2**(found-1)
end

puts ARGF.inject(0) { |weight, card| weight + weigh(card) }
