require 'rails_helper'

RSpec.feature 'Login page', type: :feature do


  scenario 'I can see the username and password inputs and the Submit button' do
    visit new_user_session_path
    expect(page.has_field?('user_email')).to be true
    expect(page.has_field?('user_password')).to be true
    expect(page.has_button?('Log in')).to be true
  end

end
