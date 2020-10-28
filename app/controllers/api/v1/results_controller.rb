class Api::V1::ResultsController < Api::V1::BaseController
  before_action :check_numbers, only: :show

  def show
    result = Bingo::Results.check(board.id, params[:numbers])
    render json: {status: 200, code: :ok, result: result, status: :ok}
  end

  private

  def board
    @board ||= Board.find(params[:board_id])
  end

  def check_numbers
    if params[:numbers].kind_of?(Array)
      return if params[:numbers].all? {|i| Integer(i, exception: false)}
    end
    render_error_payload(:bad_request, status: :bad_request)
  end
end
