# スタックを使って逆ポーランド記法の数式を計算する
stack = []
gets.split(' ').each { |op|
  case op
  when /^[0-9]+$/; stack.push v.to_i
  when /^\+$/; stack.push(stack.pop + stack.pop)
  when /^-$/;
    b = stack.pop
    stack.push(stack.pop - b)
  when /^*$/; stack.push(stack.pop * stack.pop)
  else puts "Error : not match"
  end
}
puts stack.pop
