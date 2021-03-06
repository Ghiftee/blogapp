FactoryBot.define do
  sequence :email do |n|
    "user#{n}@gmail.com"
  end

  sequence :name do |n|
    "User #{n}"
  end

  factory :user do
    name
    email
    password { 'secret_token' }
    password_confirmation { 'secret_token' }
    confirmed_at { Date.today }
    bio { 'Sample test user bio' }

    factory :admin do
      role { 'admin' }
    end

    factory :user_with_posts do
      transient do
        posts_counter { 3 }
      end

      posts do
        Array.new(posts_counter) { association(:post) }
      end
    end
  end
end
