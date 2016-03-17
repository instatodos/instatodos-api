FactoryGirl.define do
  factory :todo do
    title Faker::Hipster.words(2).join('-').downcase
  end
end
