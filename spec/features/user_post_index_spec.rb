require 'rails_helper'

RSpec.feature 'User post index page', type: :feature do
  background do
    @user = FactoryBot.create :user_with_posts
    sign_in @user
    visit user_posts_path(@user.id)
  end

  scenario "I can see the user's profile picture" do
    expect(page).to have_selector('img')
  end

  scenario "I can see the user's username" do
    expect(page).to have_content @user.name
  end

  scenario "I can see the number of posts the user has written" do
    # test not passing yet
    expect(page).to have_content "Number of posts: #{@user.posts.size}" 
  end

  scenario "I can see a post's title" do
    expect(page).to have_content @user.posts[0].title
  end

  scenario "I can see some of the post's body" do
    expect(page).to have_content @user.posts[0].text
  end

  scenario "I can see the first comments on a post" do
    expect(page).to have_content @user.posts[0].recent_comments[0]
  end

  scenario "I can see how many comments a post has" do
    expect(page).to have_content "Comments: #{@user.posts.comments.size}"
  end

  scenario "I can see how many likes a post has" do
    expect(page).to have_content "Likes: #{@user.posts.likes.size}"
  end

  scenario "I can see a section for pagination if there are more posts than fit on the view" do
    expect(page).to have_content 'Pagination'
  end

  scenario "When I click on a post, it redirects me to that post's show page" do
    post = @user.posts[0]
    click_link("Post ##{post.id} - #{post.title}")
    expect(current_path).to eq user_post_path(@user.id, post.id)
  end

end