FactoryBot.define do
  factory :todo do
    title { Faker::Hipster.words(2).join("-").downcase }
    description { Faker::Lorem.sentence }
    completed false
  end
end
