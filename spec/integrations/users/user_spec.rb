require 'rails_helper'

RSpec.describe 'User Creation', type: :system do
  before(:each) do
    @user1 = User.create(name: 'toyo', email: 'ade@gail.com', password: 'toyman', password_confirmation: 'toyman')
    @user2 = User.create(name: 'ade', email: 'toyo@gail.com', password: 'toyman1', password_confirmation: 'toyman1')
  end

  it 'allows a user to sign up and then sign in' do
    visit root_path

    click_link 'Log In'

    # Log in the user
    fill_in 'Email', with: 'ade@gail.com'
    fill_in 'Password', with: 'toyman'
    click_button 'Log in'

    # Check that the user is signed in after logging in
    expect(page).to have_content('Signed in successfully')
  end
end
