require 'rails_helper'

RSpec.describe 'Dealing Index Page', type: :system do
  before(:each) do
    @user1 = User.create(name: 'toyo', email: 'ade@gail.com', password: 'toyman', password_confirmation: 'toyman')
    @user2 = User.create(name: 'ade', email: 'toyo@gail.com', password: 'toyman1', password_confirmation: 'toyman1')

    # category
    @cat1 = Category.create(name: 'Stationay',
                            icon: 'https://www.google.com/url?sa=i&url=https%3A%2F%2F1000logos.net', user_id: @user1.id)
    @cat2 = Category.create(name: 'Fast Food', icon: 'https://www.google.com/url?sa=i&url=https%3A%2F%2F1000logos.ne',
                            user_id: @user2.id)

    # deal
    @dealing1 = Dealing.create(name: 'Deal 1', amount: 10.99, author: @user1, categories: [@cat1])
    @dealing2 = Dealing.create(name: 'Deal 2', amount: 5.99, author: @user2, categories: [@cat1])
    @dealing3 = Dealing.create(name: 'Deal 3', amount: 7.49, author: @user1, categories: [@cat2])
  end

  it 'User can see the Deals page' do
    sign_in @user1
    visit dealings_path(category_id: @cat1.id)
    expect(page).to have_content('Deal 1')
  end

  it 'User can see dealings within a category' do
    sign_in @user1
    visit dealings_path(category_id: @cat1.id)

    expect(page).to have_content('Deal 1')

    expect(page).to have_content('Deal 2')

    expect(page).not_to have_content('Deal 3')
  end

  it 'User can see new dealing link' do
    sign_in @user1
    visit dealings_path(category_id: @cat1.id)
    expect(page).to have_link('Create New Transaction', href: new_dealing_path(category_id: @cat1.id))
  end
end
