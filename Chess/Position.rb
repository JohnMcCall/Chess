class Position
  
  def initialize(x,y)
    @x = x
    @y = y
  end
  
  # This method takes a posn and finds the center of the square
  # on the board which corresponds to that posn
  # This method returns an array [x, y] which is the location of the
  # center on the screen.
  def findCenter()   
    centerX = (@x * 80)
    centerY = (@y * 80)
    
    [centerX, centerY]
  end
  
  def getX()
    @x
  end
  
  def getY()
    @y
  end
  
  def updatePosn(x,y)
    @x = x
    @y = y
  end
  
  def to_s()
    "(#{@x},#{@y})"
  end
  
  
  
end