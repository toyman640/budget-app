require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @user1 = User.create(name: 'toyo', email: 'ade@gail.com', password: 'toyman', password_confirmation: 'toyman')
    @user2 = User.create(name: 'ade', email: 'toyo@gail.com', password: 'toyman1', password_confirmation: 'toyman1')
  end

  it 'name should be present' do
    cat = Category.create(name: 'Stationay', icon: "https://www.google.com/url?sa=i&url=https%3A%2F%2F1000logos.net%2Fcoca-cola-logo%2F&psig=AOvVaw2J0sE1dk1k_UIVR4_pVNKL&ust=1695999317947000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCKD9p_jHzYEDFQAAAAAdAAAAABAI",  user_id: @user1.id)
    cat.name = nil
    expect(cat).to_not be_valid
  end

  
  it 'is not valid without an icon' do
    cat = Category.new(
      name: 'Stationary',
      user_id: @user1.id
    )
    expect(cat).to_not be_valid
  end

  it 'can have multiple dealings' do
    cat = Category.create(
      name: 'Stationary',
      icon: 'https://www.example.com/icon.png',
      user_id: @user1.id
    )

    dealing1 = Dealing.create(name: 'Deal 1', amount: 100, author: @user1, categories: [cat])
    dealing2 = Dealing.create(name: 'Deal 2', amount: 200, author: @user2, categories: [cat])

    expect(cat.dealings).to include(dealing1, dealing2)
  end

end
