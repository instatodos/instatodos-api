FactoryGirl.define do
  factory :task do
    title Faker::Hipster.words(2).join("-").downcase
    description Faker::Lorem.sentence
    completed false
  end
end
