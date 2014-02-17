#!/usr/bin/env ruby

require "rubygems"
require "rubygame"

include Rubygame
include Sprites::Sprite

class Piece

    def initialize(board, color, startingPosn, rank)
      super()
      @board = board
      @color = color
      @rank = rank
      @validMoves = Array.new
      @currentPosn = startingPosn
      @imageLocation = "images/#{@color}#{@rank}.png"
      @image = Surface.load @imageLocation
      @rect = Rect.new(startingPosn.findCenter,[80,80])
    end
    
    def generateValidMoves
      # Each piece should generate it's own list of valid moves, but 
      # I'm used to Java so I'm writing this method declaration as if
      # this were an abstract class
    end
    
    def move(posn)
      p(@validMoves)
    end
    
    def draw(onScreen)
      @image.blit(onScreen, @rect)
    end
    
    def update()
      @rect.topleft = @currentPosn.findCenter
    end
    
    def getColor()
      @color
    end
    
    def getValidMoves()
      @validMoves
    end
    
    def getCurrentPosn()
      @currentPosn
    end
    
    def setCurrentPosn(position)
      @currentPosn = position
    end
    
    def getImageLocation()
      @imageLocation
    end
    
    def getImage()
      @image
    end
    
    def getRect()
      @rect
    end
    
    def setRect(rect)
      @rect = rect
    end
    
    def to_s()
      @color + @rank + " at position:" + @currentPosn.to_s
    end
    
end