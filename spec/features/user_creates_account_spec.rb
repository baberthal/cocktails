require 'rails_helper'

feature 'User account features', js: true do
  scenario 'Creating an account' do
    visit '/'
    click_on 'Create an Account'
    fill_in 'Username', with: 'foobar'
    fill_in 'Email', with: 'foobar1@example.com'
    fill_in 'Password', with: 'foobar1secret'
    click_on 'Register'

    expect(page).to have_content 'Welcome to Cocktails!'
    expect(page).to have_content 'foobar'
  end

  scenario 'Logging into an account' do
    User.create!(username: 'foobar',
                 email: 'foobar1@example.com',
                 password: 'foobar1secret')

    visit '/'
    click_on 'Log In'
    within '#loginForm' do
      fill_in 'Email', with: 'foobar1@example.com'
      fill_in 'Password', with: 'foobar1secret'
      click_on 'Log In'
    end

    expect(page).to have_content 'Login Successful!'
    expect(page).to have_content 'foobar'
  end

end
