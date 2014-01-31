#!/usr/bin/env ruby

require "./Piece"
require "./Board"


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
