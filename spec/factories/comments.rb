FactoryBot.define do
  factory :comment do
    name { "MyString" }
    body { "MyText" }
    micropost { nil }
  end
end
