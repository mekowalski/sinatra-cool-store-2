require_relative '../spec_helper'

#RSPEC is very symantic

describe User do
  it 'has a first name, last name and email' do
    user = User.new(first_name: 'Malind', last_name: 'Kowalski', email: 'malind@whatever.com')

    expect(user).to be_valid
  end

  it 'is invalid without a first name' do
    user = User.create(last_name: 'Kowalski', email: 'malind@whatever.com')

    expect(user).to_not be_valid
  end

  it 'is invalid without a last name' do
    user = User.create(first_name: 'Malind', email: 'malind@whatever.com')

    expect(user).to_not be_valid
  end

  it 'is invalid without an email' do
    user = User.create(first_name: 'Malind', last_name: 'Kowalski')

    expect(user).to_not be_valid
  end

  it 'is invalid with a duplicate email' do
    user1 = User.create(first_name: 'Malind', last_name: 'Kowalski', email: 'malind@whatever.com')
    user2 = User.create(first_name: 'Kristopher', last_name: 'Kowalski', email: 'malind@whatever.com')

    expect(user2).to_not be_valid
  end

  it 'knows its full name' do
    user = User.new(first_name: 'Malind', last_name: 'Kowalski', email: 'malind@whatever.com')

    expect(user.full_name).to eq('Malind Kowalski')
  end

end
