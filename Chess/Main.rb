#!/usr/bin/env ruby

require "./Piece"
require "./Board"
require "./Position"
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

#Test Drawing the Board
#@screen = Screen.open [640,640]
#@background = Surface.load "images/ChessBoard.jpg"
#@background.blit @screen, [0,0]
#
#@screen.flip
### Keep the Board Drawn until a key is pressed.
#@event_queue = EventQueue.new
#@event_queue.enable_new_style_events
#until @event_queue.wait().is_a? Events::KeyPressed
#end