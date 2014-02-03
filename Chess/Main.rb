#!/usr/bin/env ruby

require "./Piece"
require "./Board"
require "rubygame"

include Rubygame
include Sprites::Sprite

#Test Piece
puts "Creating a new White Piece"
@whitePiece = Piece.new "white"

puts @whitePiece.getColor()

puts "Creating a new Black Piece"
@blackPiece = Piece.new "black"

puts @blackPiece.getColor()

#Test Board
@board = Board.new
@board.printBoard()

#Test Drawing the Board
@screen = Screen.open [640,640]
@background = Surface.load "images/ChessBoard.jpg"
@background.blit @screen, [0,0]

@screen.flip
## Keep the Board Drawn until a key is pressed.
@event_queue = EventQueue.new
@event_queue.enable_new_style_events
until @event_queue.wait().is_a? Events::KeyPressed
end
