require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#update_counter' do
    let(:user) { User.create(name: 'Cross', photo: 'CR', bio: 'My bio', posts_counter: 3) }
    let(:post) { user.posts.create(title: 'Post', text: 'Some text', comments_counter: 1, likes_counter: 0) }

    it 'updates the post counter' do
      post.comments.create(user: user, post: post, text: 'Some text')
      expect(post.comments_counter).to eq 1
    end
  end
end
