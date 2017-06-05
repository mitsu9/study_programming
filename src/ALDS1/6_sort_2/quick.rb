# http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ALDS1_6_C&lang=jp

def partition(ary, p, r)
  x = ary[r][1]
  i = p-1
  (p...r).each{ |j|
    if ary[j][1] <= x
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

def quicksort(ary, p, r)
  if p < r
    q = partition(ary, p, r)
    quicksort(ary, p, q-1)
    quicksort(ary, q+1, r)
  end
end

def stable?(in_ary, out, n)
  (0...n).each{ |i|
    (i...n).each { |j|
      if in_ary[i][1] == out[j][1]
        (i+1...n).each { |a|
          if out[j] == in_ary[a]
            (j+1...n).each { |b|
               if in_ary[i] == out[b]
                return false
              end
            }
          end
        }
      end
    }
  }
  true
end

# main
n = gets.to_i
ary = []
(0...n).each{ |n|
  c, n = gets.split(' ')
  ary << [c, n.to_i]
}

org_ary = ary.dup

quicksort(ary, 0, ary.size-1)

if stable?(org_ary, ary, n)
  puts "Stable"
else
  puts "Not stable"
end

(0...n).each{ |n|
  puts "#{ary[n][0]} #{ary[n][1]}"
}
