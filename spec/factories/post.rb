FactoryBot.define do
  factory :post do
    user
    title { 'Post' }
    text { 'Sample test post' }
  end
end