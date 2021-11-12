require 'rails_helper'

RSpec.feature 'Post show page', type: :feature do
  login_user
  background do
    @post = FactoryBot.create :post_with_comments, comments_counter: 5, user: @user
    visit user_post_path(@user.id, @post.id)
  end

  scenario 'I can see the post title' do
    expect(page).to have_content @post.title
  end


end
