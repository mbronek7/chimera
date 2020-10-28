Rails.application.routes.draw do
  alias GET get
  alias POST post
  alias PUT put
  alias PATCH patch
  alias DELETE delete

  GET "/*a", to: "application#not_found"
end
