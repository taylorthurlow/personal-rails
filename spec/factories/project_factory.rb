FactoryBot.define do
  factory :project do
    name { Faker::Games::Pokemon.unique.move }
    description { Faker::Lorem.paragraphs(2).join("\n") }
  end
end
