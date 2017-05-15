# http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ALDS1_5_B

$cnt = 0

def merge(ary, left, mid, right)
  l_ary = ary.slice(left...mid)
  r_ary = ary.slice(mid...right)
  i = j = 0
  (left...right).each { |k|
    l_val = l_ary[i] || 10**10 # because element < 10^9
    r_val = r_ary[j] || 10**10
    if l_val <= r_val
      ary[k] = l_val
      i += 1
    else
      ary[k] = r_val
      j += 1
    end
    $cnt += 1
  }
end

def merge_sort(ary, left, right)
  if left+1 < right
    mid = (right-left)/2 + left
    merge_sort(ary, left, mid)
    merge_sort(ary, mid, right)
    merge(ary, left, mid, right)
  end
end

# main
n = gets.to_i
ary = gets.split(' ').map(&:to_i)

merge_sort(ary, 0, ary.size)

puts ary.join(' ')
puts $cnt
