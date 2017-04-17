# キューを使ってラウンドロビンスケジューリングをシミュレートする
# http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ALDS1_3_B&lang=jp
n, q = gets.split(' ').map(&:to_i)
t = 0
queue = []
(0...n).each { |n|
  queue << gets.split(' ')
}
while process = queue.shift
  pt = process[1].to_i
  if pt <= q
    t += pt
    puts "#{process[0]} #{t}"
  else
    t += q
    process[1] = pt - q
    queue << process
  end
end
