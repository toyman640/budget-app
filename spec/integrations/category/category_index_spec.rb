require 'rails_helper'

RSpec.describe 'Category Index Page', type: :system do
  before(:each) do
    @user1 = User.create(name: 'toyo', email: 'ade@gail.com', password: 'toyman', password_confirmation: 'toyman')
    @user2 = User.create(name: 'ade', email: 'toyo@gail.com', password: 'toyman1', password_confirmation: 'toyman1')

    # post
    @cat1 = Category.create(name: 'Stationay', icon: "https://www.google.com/url?sa=i&url=https%3A%2F%2F1000logos.net%2Fcoca-cola-logo%2F&psig=AOvVaw2J0sE1dk1k_UIVR4_pVNKL&ust=1695999317947000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCKD9p_jHzYEDFQAAAAAdAAAAABAI",  user_id: @user1.id)
    @cat2 = Category.create(name: 'Fast Food', icon: "https://www.google.com/url?sa=i&url=https%3A%2F%2F1000logos.ne",  user_id: @user2.id)
  end

  it 'User can see the foods page' do
    sign_in @user1
    visit categories_path
    expect(page).to have_content('Categories')
  end

  it 'User1 can see Category items' do
    sign_in @user1
    visit categories_path
    expect(page).to have_content('Stationay')
  end

  it 'User2 can see food items' do
    sign_in @user2
    visit categories_path
    expect(page).to have_content('Fast Food')
  end

  it 'User can see the "Add food" link' do
    sign_in @user1
    visit categories_path
    expect(page).to have_link('Create New Category', href: new_category_path)
  end

end
