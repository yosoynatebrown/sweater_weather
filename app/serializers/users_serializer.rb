class UsersSerializer
  include JSONAPI::Serializer
  attributes :email,
             :api_key
  def self.invalid_credentials
    
  end
end