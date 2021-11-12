FactoryBot.define do
  factory :post do
    user
    title { 'Post' }
    text { 'Test post' }
  end
end