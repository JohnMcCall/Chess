require "./Piece"
require "./Board"
require "rubygems"
require "rubygame"

include Rubygame
include Sprites::Sprite

class Rook < Piece
  
  def initialize(board, color, startingPosn)
    super(board, color, startingPosn, "Rook")
    
  end
  
  def generateValidMoves()
    @validMoves = Array.new
    @validMoves = @board.getHorizontalMoves(self, @currentPosn.getX(), (7 - @currentPosn.getX()))
    @validMoves = @validMoves + @board.getVerticalMoves(self, @currentPosn.getY(), (7 - @currentPosn.getY()))
  end
end