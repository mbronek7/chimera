class Api::V1::BoardsController < Api::V1::BaseController

  def create
    board = Board.create board_properties: {strips: Bingo::Board.generate}
    render_record(serializer, board)
  end

  private

  def serializer
    BoardSerializer
  end
end
