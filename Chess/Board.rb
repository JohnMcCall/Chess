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
      valid = addValidMove(validMoves, posnToCheck, color)
      if !valid then break end
    end
    
    for i in 1..numDown
      posnToCheck = Position.new(curX, (curY + i))
      valid = addValidMove(validMoves, posnToCheck, color)
      if !valid then break end
    end
        
    validMoves
  end
  
  def getHorizontalMoves(piece, numRight, numLeft)
    validMoves = Array.new
    curX = piece.getCurrentPosn().getX()
    curY = piece.getCurrentPosn().getY()
    color = piece.getColor()
    
    for i in 1..numRight
      posnToCheck = Position.new((curX + i), curY)
      valid = addValidMove(validMoves, posnToCheck, color)
      if !valid then break end
    end
    
    for i in 1..numLeft
      posnToCheck = Position.new((curX - i), curY)
      valid = addValidMove(validMoves, posnToCheck, color)
      if !valid then break end
    end
        
    validMoves
  end
  
  def getDiagonalMoves(piece, numTopRight, numTopLeft, numBottomRight, numBottomLeft)
    validMoves = Array.new
    curX = piece.getCurrentPosn().getX()
    curY = piece.getCurrentPosn().getY()
    color = piece.getColor()
    
    for i in 1..numTopRight
      posnToCheck = Position.new((curX + i), (curY - i))
      valid = addValidMove(validMoves, posnToCheck, color)
      if !valid then break end
    end
    
    for i in 1..numTopLeft
      posnToCheck = Position.new((curX - i), (curY - i))
      valid = addValidMove(validMoves, posnToCheck, color)
      if !valid then break end
    end
    
    for i in 1..numBottomRight
      posnToCheck = Position.new((curX + i), (curY + i))
      valid = addValidMove(validMoves, posnToCheck, color)
      if !valid then break end
    end
    
    for i in 1..numBottomLeft
      posnToCheck = Position.new((curX - i), (curY + i))
      valid = addValidMove(validMoves, posnToCheck, color)
      if !valid then break end
    end
        
    validMoves
  end
  
  def getKnightMoves(piece)
    validMoves = Array.new
    curX = piece.getCurrentPosn().getX()
    curY = piece.getCurrentPosn().getY()
    color = piece.getColor()
    
    addValidMove(validMoves, Position.new(curX - 1, curY - 2), color)
    addValidMove(validMoves, Position.new(curX + 1, curY - 2), color)
    addValidMove(validMoves, Position.new(curX - 2, curY - 1), color)
    addValidMove(validMoves, Position.new(curX + 2, curY - 1), color)
    addValidMove(validMoves, Position.new(curX - 2, curY + 1), color)
    addValidMove(validMoves, Position.new(curX + 2, curY + 1), color)
    addValidMove(validMoves, Position.new(curX - 1, curY + 2), color)
    addValidMove(validMoves, Position.new(curX + 1, curY + 2), color)
    
    validMoves
  end
  
  # This method takes a list of validMoves, a position to check, and a color.
  # It then checks to see if there is a piece at the given position.
  # If there is it checks to see if it matches the given color.
  # It then decides to add the position to the list.
  def addValidMove(validMoves, posnToCheck, color)
    
    # If either the X or Y coordinate of the posnToCheck is off the board, don't add that move.
    if !posnToCheck.getX().between?(0, 7) || !posnToCheck.getY().between?(0, 7) then
      return false
    end
    
    toReturn = true
    pieceAtPosn = lookupPosn(posnToCheck)
    if pieceAtPosn then
      if pieceAtPosn.getColor() != color then
        validMoves.push(posnToCheck)
        toReturn = false
      else
        toReturn = false
      end
    else
      validMoves.push(posnToCheck)
    end
    
    toReturn
  end
  
end
