#!/usr/bin/env ruby

require "./Piece"
require "./Board"
require "./Position"
require "rubygame"

include Rubygame
include Sprites::Sprite

@clock = Clock.new
@clock.target_framerate = 60
@clock.enable_tick_events

@whitePosn = Position.new(2,2)
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
@screen = Screen.open [640,640]
@board.draw(@screen)

@whitePiece.draw(@screen)

@screen.flip
## Keep the Board Drawn until a key is pressed.
@event_queue = EventQueue.new
@event_queue.enable_new_style_events
sumTime =  @clock.tick().seconds
until @event_queue.wait().is_a? Events::KeyPressed
  seconds_passed = @clock.tick().seconds
  sumTime += seconds_passed
  p("sumTime is " + sumTime.to_s)
  if(sumTime > 0.5)
    sumTime = 0
    @whitePiece.setCurrentPosn(Position.new(Random.new().rand(8),Random.new().rand(8)))
    puts("White piece position:" + @whitePiece.to_s())
    @whitePiece.update()
    @board.draw(@screen)
    @whitePiece.draw(@screen)
    @screen.flip
  end
end

gets()
