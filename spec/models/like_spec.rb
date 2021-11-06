require 'rails_helper'

RSpec.describe Like, type: :model do
  describe '#update_counter' do
    let(:user) { User.create(name: 'Cross', photo: 'CR', bio: 'My bio', posts_counter: 3) }
    let(:post) { user.posts.create(title: 'Post', text: 'Some text', comments_counter: 0, likes_counter: 1) }

    it 'updates the likes counter' do
      post.likes.create(user: user)
      expect(post.likes_counter).to eq 1
    end
  end
end
