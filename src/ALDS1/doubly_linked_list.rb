# http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ALDS1_3_C
# input types
# - insert x
# - delete x
# - deleteFirst
# - deleteLast
n = gets.to_i
list = []
(0...n).each { |n|
  op, v = gets.split(' ')
  case op
  when /^insert$/; list.unshift v.to_i
  when /^delete$/
    idx = list.find_index(v.to_i)
    list.delete_at(idx) if idx # nilはfalse扱いになる
  when /^deleteFirst$/; list.shift
  when /^deleteLast$/; list.pop
  else puts "Error : not match"
  end
}
puts list.join(' ')
