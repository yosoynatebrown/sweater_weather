class User < ApplicationRecord
  has_secure_token :api_key
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, require: true

  has_secure_password
end
