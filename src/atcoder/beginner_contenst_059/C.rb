

# main
# TODO: 奇数 偶数 のパターンと、偶数 奇数のパターンで両方計算して、小さい方を出す
n = gets.to_i
ary = gets.split(' ').map(&:to_i)

sum = ary[0]
cnt = 0

if ary[0] == 0
  if ary[1] > 1
    sum = -1
  else
    sum = 1
  end
  cnt = 1
end

(1...n).each{ |i|
  if sum < 0
    sum += ary[i]
    if sum <= 0
      cnt += 1-sum
      sum = 1
    end
  else
    sum += ary[i]
    if sum >= 0
      cnt += sum+1 # sum-(-1)
      sum = -1
    end
  end
}

puts cnt
