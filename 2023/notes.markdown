### Day 1

How does this `?=` positive look ahead stuff work?

```ruby
> "22eightwotest3sevenine6three".scan(/(?=(1|2|3|4|5|6|7|8|9|one|two|three|four|five|six|seven|eight|nine))/)
[["2"], ["2"], ["eight"], ["two"], ["3"], ["seven"], ["nine"], ["6"], ["three"]]
```

Is there a regex to match backwrds?

### Day 2

Day 2 Part 1 Sample: 8
Day 2 Part 1 Answer: 2416
Day 2 Part 2 Sample: 2286
Day 2 Part 2 Answer: 63307