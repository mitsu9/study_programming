# http://abc066.contest.atcoder.jp/tasks/abc066_a

# main
a, b, c = gets.split(' ').map(&:to_i)
ab = a + b
bc = b + c
ca = c + a
puts [ab, bc, ca].min
