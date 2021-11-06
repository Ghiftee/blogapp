class User < ApplicationRecord
  has_many :comments
  has_many :posts
  has_many :likes

  validates :name, presence: { message: 'Name must not be blank' }
  validates_numericality_of :posts_counter, only_integer: true, greater_than_or_equal: 0

  def recent_posts(limit = 3)
    posts.includes(:comments).order(created_at: :desc).limit(limit)
  end
end
