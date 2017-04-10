# バブルソート
def bubble_sort(ary, len)
  swp = 0
  len = len - 1
  (0...len).each { |n|
    (0...len-n).each { |j|
      if ary[j] > ary[j+1]
        ary[j], ary[j+1] = ary[j+1], ary[j] # swapの書き方
        swp += 1
      end
    }
  }
  return ary, swp
end

# main
len = gets.to_i
ary = gets.split(' ').map(&:to_i) # 半角スペース区切りでintになおして配列に詰め込む
sorted_ary, swp = bubble_sort(ary, len)
puts sorted_ary.join(' ') # 半角スペース区切りで出力
puts swp
