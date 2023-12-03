@fields = ARGF.readlines.map(&:chomp)

def analyze(line,y)
  sum = 0
  line.scan(/\d+/) do |s|
    x, len = Regexp.last_match.offset(0)
    sum += s.to_i unless around(x,len,y).empty?
  end
  sum
end

def around(x1,len,y)
    fx = x1-1
    tx = len
    fy = y-1
    ty = y+1

    collected = []
    (fx..tx).each do |xp|
      (fy..ty).each do |yp|
        next if yp < 0 || xp < 0
        next if yp == y && xp >= x1 && xp <= len-1
        check(xp,yp).tap do |c|
          collected << c if c =~ /[^0-9.]/
        end
      end
    end
    collected
end

def check(x,y)
  @fields&.[](y)&.[](x)
end

#puts @fields
puts around(0,2,0).inspect
puts around(6,8,2).inspect

sum = 0
@fields.each_with_index do |line,y|
  sum +=analyze(line,y)
end
puts sum
