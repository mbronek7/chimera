Rails.application.routes.draw do
  alias GET get
  alias POST post
  alias PUT put
  alias PATCH patch
  alias DELETE delete

  scope constraints: {format: /json/}, defaults: {format: :json} do
    scope module: :api do
      scope module: :v1 do
        controller "boards" do
          POST "api/v1/boards/generate", action: :create, as: :create_board
        end
        controller "results" do
          GET "api/v1/results/:board_id", action: :show, as: :show_results
        end
      end
    end
  end

  GET "/*a", to: "application#not_found"
end
