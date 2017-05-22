# http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ALDS1_6_B&lang=jp

def partition(ary, p, r)
  x = ary[r]
  i = p-1
  (p...r).each{ |j|
    if ary[j] <= x
      i = i+1
      tmp = ary[i]
      ary[i] = ary[j]
      ary[j] = tmp
    end
  }
  tmp = ary[i+1]
  ary[i+1] = ary[r]
  ary[r] = tmp
  i+1
end

# main
n = gets.to_i
ary = gets.split(' ').map(&:to_i)
i = partition(ary, 0, ary.size-1)

ary[i] = "[#{ary[i]}]"
puts ary.join(' ')
