require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) { User.create(name: 'Cross', photo: 'CR', bio: 'My bio', posts_counter: 3) }
  let(:post) { user.posts.create(title: 'Post', text: 'New post', comments_counter: 2, likes_counter: 4) }

  describe 'GET #index' do
    before { get user_posts_path(post.user_id) }

    it 'should have the correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'displays the correct template' do
      expect(response).to render_template(:index)
    end

  end

  describe 'GET #show' do
    before do
      get user_post_path(user_id: user.id, id: post.id)
    end

    it 'should have the correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'displays the correct template' do
      expect(response).to render_template(:show)
    end

  end
end
