require "name_generator"

FactoryGirl.define do
  factory :todo do
    sequence(:title) { NameGenerator.instance.name }
    factory :todo_with_tasks do
      after(:create) do |todo, _evaluator|
        FactoryGirl.create(:task, todo: todo)
        FactoryGirl.create(:task, todo: todo)
        FactoryGirl.create(:task, todo: todo)
      end
    end
  end
end
