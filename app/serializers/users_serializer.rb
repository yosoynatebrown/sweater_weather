class UsersSerializer
  include JSONAPI::Serializer
  attributes :email,
             :api_key
  def self.invalid_credentials
    {
      message: "Incorrect credentials",
      errors: [
        "Your login is invalid. Cannot authenticate."
      ]
    }
  end
end