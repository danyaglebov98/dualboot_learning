# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    name
    description

    trait :have_author do
      author
    end
    trait :have_asignee do
      asignee
    end
    factory :auhtor_task, traits: [:have_author]
    factory :asignee_task, traits: [:have_asignee]
  end
end
