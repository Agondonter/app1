FactoryBot.define do
  sequence(:email) { |n| "user#{n}@example.com"}

  factory :user do
  	email
  	password { "example" }
  	first_name { "David" }
  	last_name { "Murdock" }
  	admin { false }
  end	

  factory :admin, class: User do
  	email
  	password { "admin" }
  	admin { true }
  	first_name { "Admin" }
  	last_name { "User" }
  end
end