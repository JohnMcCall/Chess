#!/usr/bin/env ruby

require "rubygems"
require "rubygame"

include Rubygame
include Sprites::Sprite

class Piece

    def initialize(color, startingPosn)
      super()
      
      @color = color
      @validMoves = Array.new
      @currentPosn = startingPosn
      @imageLocation = "images/WhitePawn.png"
      @image = Surface.load @imageLocation
      @rect = Rect.new(startingPosn.findCenter,[80,80])
    end
    
    def draw(onScreen)
      @image.blit(onScreen, @rect)
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
      @color
    end
    
end