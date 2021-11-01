FactoryBot.define do
  factory :micropost do
    content { Faker::TvShows::Buffy.character }
    context { Faker::TvShows::Buffy.character }

    user
  end
end
