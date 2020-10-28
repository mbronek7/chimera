class Api::V1::BoardsControllerTest < ApplicationIntegrationTest
  test "client can generate new board" do
    POST create_board_url(number: 1, format: :json)
    assert response.code, equal: OK
    boards = response.parsed_body["data"]
    assert boards.first["attributes"]["id"].present?, true
    assert boards.first["attributes"]["board_properties"].present?, true
  end

  test "client can generate multiple boards" do
    POST create_board_url(number: 3, format: :json)
    assert response.code, equal: OK
    boards = response.parsed_body["data"]
    assert boards.size, equal: 3
    assert boards.first["attributes"]["id"].present?, true
    assert boards.first["attributes"]["board_properties"].present?, true
  end
end
