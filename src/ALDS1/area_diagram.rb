# http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ALDS1_3_D&lang=jp

sum = 0
stack = [] # \を受け取ったindexのstack
res = [] # /に対応する\のindexとその時に計算した面積のtupleのstack. 最後に各断面の面積として表示する
gets.split("").each_with_index { |v, i|
  if v == "\\"
    stack << i
  elsif v == "/"
    j = stack.pop
    if !j.nil? # \より先に/が来たときのため
      a = i - j # indexの引き算で横向きに計算する
      sum += a

      loop do
        k, b = res.pop
        if !k.nil?
          if j < k
            a += b
          else
            res << [k, b] # 一旦popしてるので特に何もなければ再度pushして戻す
            break
          end
        else
          break
        end
      end
      res << [j, a]
    end
  end
}
puts sum
if res.size() == 0
  puts "0"
else
  puts "#{res.size()} #{res.map{|n| n[1]}.join(" ")}" # size == 0の時にmapがうまくいかない??
end
