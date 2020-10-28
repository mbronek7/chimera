class Api::V1::BaseController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound do
    render_error_payload(:not_found, status: :not_found)
  end

  rescue_from ActiveRecord::RecordInvalid do
    render_error_payload(:bad_request, status: :bad_request)
  end
end
