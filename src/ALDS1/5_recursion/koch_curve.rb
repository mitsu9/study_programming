# http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ALDS1_5_C&lang=jp

$cos60 = 0.5
$sin60 = 0.86602540378

def koch(d, p1, p2)
  if d == 0
    return
  end
  sx = (2*p1[0] + 1*p2[0])/3
  sy = (2*p1[1] + 1*p2[1])/3
  tx = (1*p1[0] + 2*p2[0])/3
  ty = (1*p1[1] + 2*p2[1])/3
  ux = (tx-sx)*$cos60 - (ty-sy)*$sin60 + sx
  uy = (tx-sx)*$sin60 + (ty-sy)*$cos60 + sy
  koch(d-1, [p1[0], p1[1]], [sx, sy])
  puts format("%.8f %.8f", sx, sy)
  koch(d-1, [sx, sy], [ux, uy])
  puts format("%.8f %.8f", ux, uy)
  koch(d-1, [ux, uy], [tx, ty])
  puts format("%.8f %.8f", tx, ty)
  koch(d-1, [tx, ty], [p2[0], p2[1]])
end

# main
n = gets.to_i

puts format("%.8f %.8f", 0.0, 0.0)
koch(n, [0.0,0.0], [100.0,0.0])
puts format("%.8f %.8f", 100.0, 0.0)
