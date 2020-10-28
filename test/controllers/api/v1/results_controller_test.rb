require "matrix"

class Api::V1::ResultssControllerTest < ApplicationIntegrationTest

  test "with non existing board" do
    GET show_results_url(4, numbers: [1,2,3,4], format: :json)
    assert response.code, equal: NOT_FOUND
  end

  test "with wrong numbers" do
    GET show_results_url(4, numbers: [1,2,nil,4], format: :json)
    assert response.code, equal: BAD_REQUEST
  end

  test "with unlucky numbers" do
    board = Board.create! board_properties: {strips: Bingo::Board.generate}
    m = Matrix.columns(board.strips)
    numbers = m.row(0).to_a.compact
    numbers.pop
    GET show_results_url(board.id, numbers: numbers, format: :json)
    assert response.code, equal: OK
    assert response.parsed_body["result"], equal: Bingo::Results::LOST
  end

  test "with lucky numbers" do
    board = Board.create! board_properties: {strips: Bingo::Board.generate}
    m = Matrix.columns(board.strips)
    numbers = m.row(0).to_a.compact
    GET show_results_url(board.id, numbers: numbers, format: :json)
    assert response.code, equal: OK
    assert response.parsed_body["result"], equal: Bingo::Results::WIN
  end
end
