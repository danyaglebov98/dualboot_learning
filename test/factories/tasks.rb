FactoryBot.define do
  factory :task do
    name 
    description

    trait :have_author do 
      author

    trait :have_asignee do 
      asignee

      factory:auhtor_task, traits:[:have_author]
      factory:asignee_task, traits:[:have_asignee]
  end
end
