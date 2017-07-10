# http://abc066.contest.atcoder.jp/tasks/arc077_b

# main
n = gets.to_i
ary = gets.split(' ').map(&:to_i)

# count combination
n += 1
(1..n).each{ |i|
  c = 1
  (1...i).each{|j|
    c *= n-j
    c /= j
  }
  puts "#{n}C#{i} = #{c}"
  # 重複を消す

}
