# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    password { 'password123' }
    password_confirmation { 'password123' }
    email { Faker::Internet.email }
    api_key { '' }
  end
end
