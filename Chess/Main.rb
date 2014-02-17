#!/usr/bin/env ruby

require "./Piece"
require "./Board"
require "./Position"
require "./CursorController"
require "./Rook"
require "rubygame"

include Rubygame
include Sprites::Sprite

#@whitePosn = Position.new(2,2)
#@blackPosn = Position.new(4,4)
#
#@whitePiece = Piece.new @board, "White", @whitePosn, "Pawn"
#@blackPiece = Piece.new @board, "Black", @blackPosn, "Pawn"

@board = Board.new
#@board.updatePosn(@whitePiece,@whitePosn)
#@board.updatePosn(@blackPiece,@blackPosn)

@whiteRook = Rook.new(@board, "White", Position.new(6,6))
@whiteRook.generateValidMoves()

@screen = Screen.open [640,640]
@board.draw(@screen)

@whiteRook.draw(@screen)

@screen.flip

## Keep the Board Drawn until a key is pressed.
@cursor = CursorController.new()
@event_queue = EventQueue.new
@event_queue.enable_new_style_events

@run = true
while @run
  @event_queue.each do |event|
    case event
    
    when Events::KeyPressed
      if(event.key == :q)
        @run = false
      end
    
    when Events::MouseReleased
      p(event.pos)
      newPosn = @cursor.convertToPosition(event.pos)
      @whiteRook.move(newPosn)
      @whiteRook.generateValidMoves()
      puts("White piece position:" + @whiteRook.to_s())
      p @whiteRook.getValidMoves()
      @whiteRook.update()
      @board.draw(@screen)
      @whiteRook.draw(@screen)
      @screen.flip
      
    end
  end

end
