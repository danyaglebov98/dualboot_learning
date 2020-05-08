# frozen_string_literal: true

FactoryBot.define do
  factory :manager, parent: :user do
    type { 'Manager' }
  end
end
