FactoryBot.define do
  sequence :email do |n|
    "user#{n}@gmail.com"
  end

  sequence :name do |n|
    "User Number#{n}"
  end

  factory :user do
    name
    email
    password { 'secret_token' }
    password_confirmation { 'secret_token' }
    confirmed_at { Date.today }
    bio { 'Sample test user bio' }

  end
end
