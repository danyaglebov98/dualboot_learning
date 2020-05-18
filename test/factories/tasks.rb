# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    name
    description

    trait :have_author do
      author factory: :manager
    end

    trait :have_asignee do
      asignee factory: :developer
    end
  end
end
