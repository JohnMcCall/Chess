class Board
  
  def initialize
    super()
    
    @board = Array.new(8) {Array.new(8)}
    @board[1][5] = "YES"
    @board[5][1] = "NO"
  end
  
  def printBoard()
    @board.each do |row|
      row.each do |col| 
        print "#{col} "
      end
      puts
    end
  end
  
  # Sticking to standard Cartesian coords here, so I need to reverse the X and Y
  def lookupPosn(posn)
    @board[posn.getY()][posn.getX()]
  end
  
  def updatePosn(elt, posn)
    @board[posn.getY()][posn.getX()] = elt
  end
  
end
