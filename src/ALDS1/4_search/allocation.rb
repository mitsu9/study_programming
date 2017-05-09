# http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ALDS1_4_D&lang=jp

def available?(ary, p, k)
  sum = 0
  tracks = 1
  ary.each{ |w|
    if sum + w <= p
      sum += w
    else
      sum = w
      tracks += 1
    end
  }
  tracks <= k
end

def binary(ary, l, r, k)
  if l == r
    return l
  else
    c = ((r - l)/2).to_i + 1 + l
    if available?(ary, c, k)
      binary(ary, l, c-1, k)
    else
      binary(ary, c, r, k)
    end
  end
end

def find_p(ary, k)
  l = ary.max
  r = ary.inject(:+)
  p = binary(ary, l, r, k)
  p += 1 unless available?(ary, p, k)
  p
end

## main
n, k = gets.split(' ').map(&:to_i)
ary = []
(0...n).each { |n|
  ary << gets.to_i
}
puts find_p(ary, k)
