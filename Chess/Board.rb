class Board
  
  def initialize
    super()
    
    @board = Array.new(8) {Array.new(8)}
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
  
  # This method checks the up/down moves for a piece. numPos and numNeg
  # are the amount of positions to check in each direction.
  def getVerticalMoves(piece, numUp, numDown)
    validMoves = Array.new
    curX = piece.getCurrentPosn().getX()
    curY = piece.getCurrentPosn().getY()
    color = piece.getColor()
    
    for i in 1..numUp
      posnToCheck = Position.new(curX, (curY - i))
      pieceAtPosn = lookupPosn(posnToCheck)
      if pieceAtPosn then
        if pieceAtPosn.getColor() != color then
          validMoves.push(posnToCheck)
        else
          break
        end
      else
        validMoves.push(posnToCheck)
      end
    end
    
    for i in 1..numDown
      posnToCheck = Position.new(curX, (curY + i))
        puts posnToCheck
      pieceAtPosn = lookupPosn(posnToCheck)
      if pieceAtPosn then
        if pieceAtPosn.getColor() != color then
          validMoves.push(posnToCheck)
        else
          break
        end
      else
        validMoves.push(posnToCheck)
      end
    end
        
    validMoves
  end
  
  def getHorizontalMoves(piece, numRight, numLeft)
  end
  
  def getDiagonalMoves(piece, numTopRight, numTopLeft, numBottomRight, numBottomLeft)
  end
  
  def getKnightMoves(piece)
  end
  
end
