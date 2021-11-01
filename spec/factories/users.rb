FactoryBot.define do
  factory :user do
    name {Faker::Name.first_name}
    email {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 8)}
    admin { false }
  end

  factory :admin, parent: :user do
    admin { true }
    name {"admin"}
    email {"admin@admin"}
    password {"123456789"}
  end
end
