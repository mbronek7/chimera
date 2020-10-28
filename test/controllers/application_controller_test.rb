class ApplicationControllerTest < ApplicationIntegrationTest
  test "it renders correct not found message on non existing routes" do
    GET path_with_host("random_not_existing_path")
    assert response.code, equal: NOT_FOUND
    assert response.body, equal: ErrorPayload.new(:not_found, :not_found).as_json.to_json
  end
end
