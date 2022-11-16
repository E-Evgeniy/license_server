FactoryBot.define do
  factory :product do
    name { "MyString" }
    comment { "MyString" }

    trait :invalid do
      name { nil }
    end
  end
end
