#!/usr/bin/env ruby

require "rubygems"

class Piece

    def initialize(color)
        @color = color
        @validMoves = Array.new
        @currentPosn
    
    end
    
    def getColor()
      @color
    end

end