FactoryGirl.define do
  factory :todo do
    title Faker::Hipster.words(2).join("-").downcase
    factory :todo_with_tasks do
      after(:create) do |todo, _evaluator|
        FactoryGirl.create(:task, todo: todo)
        FactoryGirl.create(:task, todo: todo)
        FactoryGirl.create(:task, todo: todo)
      end
    end
  end
end
