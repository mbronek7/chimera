class ApplicationController < ActionController::API
  def not_found
    render_error_payload(:not_found, status: :not_found)
  end

  protected

  def render_error_payload(identifier, status: :bad_request)
    render json: ErrorPayload.new(identifier, status), status: status
  end
end
