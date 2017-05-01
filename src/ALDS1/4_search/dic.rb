# http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ALDS1_4_C
# A,C,G,Tしかない
# 辞書風に探索していく

$dict = {:val => 0}

def insert(v)
  now = $dict
  v.split('').each{|c|
    d = now[c]
    if d == nil
      d = {:val => 0}
      now[c] = d
    end
    now = d
  }
  now[:val] = 1
end

def find(v)
  now = $dict
  v.split('').each{|c|
    d = now[c]
    if d == nil
      puts "no"
      return
    end
    now = d
  }
  if now[:val] == 1
    puts "yes"
  else
    puts "no"
  end
end

n = gets.to_i
(0...n).each { |n|
  op, v = gets.split(' ')
  if op == "insert"
    insert(v)
  elsif op == "find"
    find(v)
  end
}
