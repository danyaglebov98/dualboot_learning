# frozen_string_literal: true

FactoryBot.define do
  sequence :email do |n|
    "login#{n}@mail.com"
  end

  sequence :string, aliases: [:first_name, :last_name, :password, :avatar, :description] do |n|
    "string#{n}"
  end

  sequence :expired_at do
    Time.current
  end
end
