require "rubygems"
require "rubygame"

include Rubygame

class CursorController
  
  def initialize()
    super()
    
  end
  
  # mousePosition is an Array
  def convertToPosition(mousePosition)
    xPosn = (mousePosition[0] / 80).floor
    yPosn = (mousePosition[1] / 80).floor
    Position.new(xPosn,yPosn)
  end
    
end