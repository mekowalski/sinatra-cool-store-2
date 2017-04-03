require_relative '../spec_helper'

describe Cart do
  before(:each) do
    @cart = Cart.create
  end

  it 'is created with a default status of pending' do
    expect(@cart.status).to eq('pending')
  end

  it 'knows if its status has changed' do
    cart.status = 'submitted'

    expect(@cart.status). to eq('submitted')
  end

  describe 'associations' do
    it 'belongs to a user' do
      @cart = Cart.create
      user = User.create(first_name: 'Malind', last_name: 'Kowalski', email: 'malind@whatever.com')

      user.carts << @cart

      expect(@cart.user).to eq(user)
    end
  end
end
