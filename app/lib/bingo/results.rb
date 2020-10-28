require "matrix"

class Bingo::Results
  WIN = "WIN"
  LOST = "LOST"

  def self.check(board_id, numbers)
    board = Board.find(board_id)
    m = Matrix.columns(board.strips)
    (0..3).each do |i|
      row_numbers = m.row(0).to_a.compact
      return WIN if (row_numbers - numbers.map(&:to_i)).empty?
    end
    LOST
  end
end
