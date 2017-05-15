# http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ALDS1_5_A&lang=jp

def recursion(queue, data, res)
  if data.size == 0
    res << queue.inject(0, :+)
  else
    d = data.slice(1..data.size)
    res = recursion(queue, d, res)
    res = recursion(queue + [data[0]], d, res)
  end
end

# main
n = gets.to_i
ary = gets.split(' ').map(&:to_i)
q = gets.to_i
targets = gets.split(' ').map(&:to_i)
res = recursion([], ary, [])
targets.each{ |t|
  if res.include?(t)
    puts 'yes'
  else
    puts 'no'
  end
}
