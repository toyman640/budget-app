require 'rails_helper'

RSpec.describe Dealing, type: :model do
  before(:each) do
    @user1 = User.create(name: 'toyo', email: 'ade@gail.com', password: 'toyman', password_confirmation: 'toyman')
    @user2 = User.create(name: 'ade', email: 'toyo@gail.com', password: 'toyman1', password_confirmation: 'toyman1')
  end

  it 'name should be present' do
    deal = Dealing.create(name: 'Stationay', amount: 2.99, author: @user1)
    deal.name = nil
    expect(deal).to_not be_valid
  end

  it 'does not change the amount if it is already set' do
    deal = Dealing.new(amount: 5.99)
    deal.valid?
    expect(deal.amount).to eq(5.99)
  end
end
