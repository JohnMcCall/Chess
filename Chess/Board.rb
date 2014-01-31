class Board
  
  def initialize
    super()
    
    #@board = Array.new(8) {Array.new(8)}
    @board = [[0,1,2,3,4,5,6,7],[8,9,10,11,12,13,14,15],[16,17,18,19,20,21,22,23]]
  end
  
  def printBoard()
    @board.each do |row|
      row.each do |x| 
        print "#{x} "
      end
      puts
    end
  end
  
end
