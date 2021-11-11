require 'rails_helper'

RSpec.feature 'Login page', type: :feature do


  scenario 'I can see the username and password inputs and the Submit button' do
    visit new_user_session_path
    expect(page.has_field?('user_email')).to be true
    expect(page.has_field?('user_password')).to be true
    expect(page.has_button?('Log in')).to be true
  end

  scenario 'When I click the submit button without filling in the username and the password, I get a detailed error.' do
    visit new_user_session_path
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password'
  end

  scenario 'When I click the submit button after filling in the username and the password with incorrect data, I get a detailed error.' do
    visit new_user_session_path
    within 'form' do
      fill_in 'user_email', with: 'user@gmail.com'
      fill_in 'user_password', with: 'sample_password'
    end
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password'
  end
  

end
