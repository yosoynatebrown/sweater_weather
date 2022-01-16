FactoryBot.define do
  factory :user do
    username { "MyString" }
    password_digest { "MyString" }
    email { "MyString" }
    api_key { "" }
  end
end
