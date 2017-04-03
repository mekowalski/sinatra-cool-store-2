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

  describe 'class methods'do

    describe 'total' do
      let(:cart) {Cart.create}
      let(:items) {Item.create(name: 'Blackberry', price: 400, inventory: 50)}
      let(:items) {Item.create(name: 'French Press', price: 150, inventory: 25)}

      it 'returns 0 if there are no items in the cart' do
        expect(cart.total). to eq(0)
      end

      it 'returns the total price of items in the cart' do
        cart.items << item
        cart.items << item2

        expect(cart.total).to eq(550)
      end
    end

  end

  describe 'associations' do
    it 'belongs to a user' do
      @cart = Cart.create
      user = User.create(first_name: 'Malind', last_name: 'Kowalski', email: 'malind@whatever.com')

      user.carts << @cart

      expect(@cart.user).to eq(user)
    end

    it 'has many items' do
      item1 = Item.create(name: 'Blackberry', price: 400, inventory: 50)
      item2 = Item.create(name: 'French Press', price: 150, inventory: 25)

      @cart.items << item1
      @cart.items << item2

      expect(@cart.items.size).to eq(2)
    end
  end
end
