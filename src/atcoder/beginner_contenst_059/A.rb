# main
puts gets.split(' ').map(&:to_s).map{|str| str[0,1].upcase}.join()
