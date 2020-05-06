# frozen_string_literal: true

FactoryBot.define do
  factory :developer, parent: :user do
    type { 'Developer' }
  end
end
