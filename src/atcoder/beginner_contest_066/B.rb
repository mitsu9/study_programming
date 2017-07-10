# http://abc066.contest.atcoder.jp/tasks/abc066_b

# strが偶文字列かどうかを返す
def is_guumoji?(str)
  if str.length.even?
    str[0...str.length/2] == str[str.length/2...str.length]
  else
    false
  end
end

# main
str = gets
(2...str.length).each{ |i|
  target_str = str[0...-i]
  if is_guumoji?(target_str)
    puts target_str.length
    break
  end
}
