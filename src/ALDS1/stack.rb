# スタックを使って逆ポーランド記法の数式を計算する
stack = []
gets.split(' ').each { |op|
  case op
  when /^[0-9]+$/; stack << op.to_i
  when /^\+$/; stack << stack.pop + stack.pop
  when /^-$/;
    b = stack.pop
    stack << stack.pop - b
  when /^*$/; stack << stack.pop * stack.pop
  else puts "Error : not match"
  end
}
puts stack.pop

=begin

# pop(2)とinjectを使って書き換えた場合
case op
when /^[0-9]+$/; stack << op.to_i
when /^\+$/; stack << stack.pop(2).inject(:+)
when /^-$/; stack << stack.pop(2).inject(:-)
when /^*$/; stack << stack.pop(2).inject(:*)
else puts "Error : not match"
end

# 上のものをさらにまとめる
# $&は正規表現にマッチした部分を持った変数
# 正規表現の中は+を先に書くと意味がおかしくなってエラーになる
case op
when /^[0-9]+$/; stack << op.to_i
when /^[-+*]$/; stack << stack.pop(2).inject($&)
else puts "Error : not match"
end

=end
