#!/usr/bin/env ruby

require "./Piece"
require "./Board"
require "./Position"
require "./CursorController"
require "./Rook"
require "rubygame"

include Rubygame
include Sprites::Sprite


@whitePosn = Position.new(2,2)
@blackPosn = Position.new(4,4)

@whitePiece = Piece.new @board, "White", @whitePosn, "Pawn"
@blackPiece = Piece.new @board, "Black", @blackPosn, "Pawn"

@board = Board.new
@board.updatePosn(@whitePiece,@whitePosn)
@board.updatePosn(@blackPiece,@blackPosn)

@testRook = Rook.new(@board, "White", Position.new(6,6))

@testRook.move @whitePosn
@whitePiece.move @whitePosn

@testRook.generateValidMoves()

@testRook.move @whitePosn
@whitePiece.move @whitePosn

@validWhite = @board.getKnightMoves(@whitePiece)
@validBlack = @board.getKnightMoves(@blackPiece)

#@board.printBoard()
@screen = Screen.open [640,640]
@board.draw(@screen)

@whitePiece.draw(@screen)

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
      @whitePiece.setCurrentPosn(newPosn)
      puts("White piece position:" + @whitePiece.to_s())
      @whitePiece.update()
      @board.draw(@screen)
      @whitePiece.draw(@screen)
      @screen.flip
      
    end
  end

end
