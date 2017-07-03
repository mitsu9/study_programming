def play_cnt(x, y, cnt)
  if (x == 1 && y == 0) ||
     (x == 1 && y == 1) ||
     (x == 0 && y == 1)
    return cnt
  end


end

# main
x, y = gets.split(' ')
cnt = play_cnt(x, y, 0)

# その後の道が決まる数字
# W 1 0
# W 1 1
# L 2 0 -> 0 1
# W 2 1 -> 0 2 -> 1 0
# W 2 2 -> 3 0 -> 1 1
# L 3 0 -> 1 1
# L 3 1 -> 1 2 -> 2 0 -> 1 0
