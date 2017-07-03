# http://rco-contest-2017-qual.contest.atcoder.jp/tasks/rco_contest_2017_qual_a

class PieceCalculator
  def initialize(h, w, k, ary)
    @did_pieces = []
    @H = h
    @W = w
    @K = k
    @ary = ary
  end

  def create_pieces
    pieces = []
    missed_count = 0
    while missed_count < 100
      piece = create_piece
      if !piece.nil?
        pieces << piece
      else
        missed_count += 1
      end
    end
    pieces
  end

  # pieceを作成する
  def create_piece
    start = get_start_point
    piece = [start]
    @did_pieces << start
    (0...7).each{
      neighbors = find_neighbors(piece)
      if neighbors.length == 0
        @did_pieces = @did_pieces - piece
        return nil
      else
        selected = neighbors.first
        neighbors.each{ |v|
          i, j = v[0], v[1]
          i_now, j_now = selected[0], selected[1]
          if @ary[i][j] > @ary[i_now][j_now]
            selected = [i, j]
          end
        }
        piece << selected
        @did_pieces << selected
      end
    }
    piece
  end

  def get_start_point
    i, j = rand(@H), rand(@W)
    while @ary[i][j] == 0 || (@did_pieces != [] && @did_pieces.include?([i, j]))
      i, j = rand(@H), rand(@W)
    end
    [i, j]
  end

  # ピース隣接するマスを返す
  def find_neighbors(piece)
    neighbors = []
    piece.each{ |ary|
      i, j = ary[0], ary[1]
      neighbors << [i+1, j] if i+1 < 50 && @ary[i+1, j] != 0
      neighbors << [i-1, j] if 0 <= i-1 && @ary[i-1, j] != 0
      neighbors << [i, j+1] if j+1 < 50 && @ary[i, j+1] != 0
      neighbors << [i, j-1] if 0 <= j-1 && @ary[i, j-1] != 0
    }
    piece.each{ |ary|
      neighbers = neighbors - ary
    }
    neighbors - @did_pieces
  end
end

# ピースの出力
def print_pieces(pieces)
  puts pieces.length
  pieces.each{ |piece|
    piece.each{ |ary|
      puts "#{ary[0]+1} #{ary[1]+1}"
    }
  }
end

H, W, K = gets.split(" ").map(&:to_i)

ary = []
(0...H).each{
  ary << gets.split("").map(&:to_i)
}

pc = PieceCalculator.new(H, W, K, ary)

pieces = []
pieces = pc.create_pieces

print_pieces(pieces)
