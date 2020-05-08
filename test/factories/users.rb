# frozen_string_literal: true

FactoryBot.define do
  factory :user, aliases: [:author, :assignee] do
    first_name
    last_name
    password 
    email 
    avatar
  end


  factory :developer do
    type { "Developer" }
  end

  factory :manager do
    type { "Manager" }
  end

  factory :admin do 
    type { "Admin" }
  end
end
