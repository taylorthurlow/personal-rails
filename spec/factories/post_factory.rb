FactoryBot.define do
  factory :post do
    title { Faker::Book.unique.title }
    contents { Faker::Lorem.paragraphs(10).join("\n") }
    slug { title.parameterize }
    tags { build_list :tag, 3 }
  end
end
