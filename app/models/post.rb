class Post < ApplicationRecord
  belongs_to :user

  def update_posts_counter(value)
    user.update('posts_counter', value)
  end
end
