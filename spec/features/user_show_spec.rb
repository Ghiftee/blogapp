require 'rails_helper'

RSpec.feature 'User index page', type: :feature do
  background do
    @user = FactoryBot.create :user_with_posts
    sign_in @user
    visit user_path(@user.id)
  end

  scenario 'I can see the profile picture of the user' do
    expect(page).to have_selector('img')
  end

  scenario 'I can see the username' do
    expect(page).to have_content @user.name
  end

  scenario 'I can see the number of posts each user has written' do
    # test not passing yet
    expect(page).to have_content "Number of posts: #{@user.posts.size}" 
  end

  scenario 'I can see the bio of the user' do
    expect(page).to have_content @user.bio
  end

  scenario 'I should see the first 3 posts of the user' do
    expect(all('.user-posts').length).to eq 3
  end

  scenario "I can see a button that lets me view all of a user's posts" do
    expect(find_link('See all post').visible?).to be true
  end

  scenario "When I click a user's post, it redirects me to that post's show page" do
    post = @user.recent_posts[0]
    click_link("user_post#{post.id}")
    expect(current_path).to eq user_post_path(@user.id, post.id)
  end
end
  