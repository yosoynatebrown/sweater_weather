module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      render json: { error: "Unauthorized API key" }, status: 401
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      render json: { errors: e.message }, status: 401
    end
  end
end