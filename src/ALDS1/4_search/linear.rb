# linear search
n = gets.to_i
ary = gets.split(' ').map(&:to_i)
q = gets.to_i
target = gets.split(' ').map(&:to_i)
is = ary & target
puts is.size
# 以下のコードだとaryの中に2つあった場合に2個カウントしてしまうのでエラー
# res = 0
# ary.each{ |v|
#   if target.include?(v)
#     res += 1
#   end
# }
