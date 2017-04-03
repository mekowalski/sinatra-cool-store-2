class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :items


  def total
    items.inhect(0) {|sume, item| sum += item.price}
  end
end
