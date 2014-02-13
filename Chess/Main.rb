#!/usr/bin/env ruby

require "./Piece"
require "./Board"
require "./Position"
require "./Drawer"
require "rubygame"

include Rubygame
include Sprites::Sprite

@whitePosn = Position.new(0,0)
@blackPosn = Position.new(4,4)

@whitePiece = Piece.new "white", @whitePosn
@blackPiece = Piece.new "black", @blackPosn

@board = Board.new
@board.updatePosn(@whitePiece,@whitePosn)
@board.updatePosn(@blackPiece,@blackPosn)

@validWhite = @board.getKnightMoves(@whitePiece)
@validBlack = @board.getKnightMoves(@blackPiece)

print @validWhite
puts
print @validBlack
puts
#@board.printBoard()

@drawer = Drawer.new()

@drawer.drawBoard()
@drawer.drawPiece(@whitePiece)
