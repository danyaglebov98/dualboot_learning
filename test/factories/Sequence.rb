FactoryBot.define do
    sequence :email do |n|
        "login#{n}@mail.com"
    end

    sequence(:string, aliases: %i[ name first_name last_name password avatar description ]) do |n|
        "str#{n}"
    end

    sequence :expired_at do
        Time.current
    end
    
end


