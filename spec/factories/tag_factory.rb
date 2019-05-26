FactoryBot.define do
  factory :tag do
    name { Faker::Games::Pokemon.unique.name }

    trait :with_posts do
      after :create do |tag|
        create_list(:post, 3, tags: [tag])
      end
    end
  end
end
