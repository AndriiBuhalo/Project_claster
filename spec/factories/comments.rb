FactoryBot.define do
  factory :comment do
    body { "MyText" }
    micropost { nil }
  end
end
