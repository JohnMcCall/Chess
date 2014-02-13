require "rubygame"

include Rubygame
include Sprites::Sprite

class Drawer
  
  def initialize()
    super()
    
    
  end
  
  def drawBoard()
    @screen = Screen.open [640,640]
    @background = Surface.load "images/ChessBoard.jpg"
    @background.blit @screen, [0,0]
    
    @screen.flip
    ## Keep the Board Drawn until a key is pressed.
    @event_queue = EventQueue.new
    @event_queue.enable_new_style_events
    until @event_queue.wait().is_a? Events::KeyPressed
    end
  end
  
  def drawPiece(piece)
    
  end
  
  # This method takes a posn and finds the center of the square
  # on the board which corresponds to that posn
  # This method returns an array [x, y] which is the location of the
  # center on the screen.
  def findCenter(posn)
    x = posn.getX()
    y = posn.getY()
    
    centerX = (x * 80) + 40
    centerY = (y * 80) + 40
    
    [centerX, centerY]
  end
  
end