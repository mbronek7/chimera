class Api::V1::BoardsController < Api::V1::BaseController

  def create
    board_ids = GenerateBoardsService.generate(params[:number].to_i)
    boards = Board.where(id: board_ids)
    render json: serializer.new(boards).serializable_hash
  end

  private

  def serializer
    BoardSerializer
  end
end
