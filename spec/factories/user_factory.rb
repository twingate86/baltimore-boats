FactoryBot.define do
sequence(:email) { |n| "user#{n}@example.com" }
  factory :user, class: User do
    email 
    password { "1234567890" }
    first_name { "Peter" }
    last_name { "Example" }
    admin { false }
  end
  factory :user2, class: User do
    email 
    password { "1234567890" }
    first_name { "Joe" }
    last_name { "Schmo" }
    admin { false }
  end
  factory :admin, class: User do
    email 
    password { "1234567890" }
    first_name { "Admin" }
    last_name { "UserAdmin" }
    admin { true }
  end
end