# frozen_string_literal: true

FactoryBot.define do
  sequence :email do |n|
    "login#{n}@mail.com"
  end

  sequence(:string, aliases: [:name, :first_name, :last_name, :password, :avatar, :description]) do |n|
    "str#{n}"
  end

  sequence :expired_at do
    Time.current
  end
end
