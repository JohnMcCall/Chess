#!/usr/bin/env ruby

require "rubygems"

class Piece

    def initialize(color, startingPosn)
      super()
      
      @color = color
      @validMoves = Array.new
      @currentPosn = startingPosn
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
    
end