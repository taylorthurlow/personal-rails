FactoryBot.define do
  factory :login do
    username { Faker::Internet.unique.username }
    password { "password" }
  end
end
