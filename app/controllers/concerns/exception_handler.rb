module ExceptionHandler
  extend ActiveSupport::Concern
def invalid_credentials
    {
      message: "Invalid credentials",
      errors: [
        "Your login or API key is invalid. Cannot authenticate."
              ]
    }
end
  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      render json: invalid_credentials, status: 401
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      render json: invalid_credentials, status: 401
    end
  end
end