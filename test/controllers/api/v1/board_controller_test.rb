class  Api::V1::BoardsControllerTest < ApplicationIntegrationTest
  test "client can generate new board" do
    GET create_board_url(format: :json)
    assert response.code, equal: OK
    board = response.parsed_body["data"]["attributes"]
    assert board["id"].present?, true
    assert board["board_properties"].present?, true
  end
end
