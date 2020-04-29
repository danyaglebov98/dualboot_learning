FactoryBot.define do
  factory :user, aliases %i[author asignee] do
    first_name 
    last_name 
    password
    email 
    avatar 
  end
end
