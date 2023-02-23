class CartItem < ApplicationRecord
  belongs_to :custmoer,optional: true
  belongs_to :item,optional: true

  # 税金算出のためのメソッド
  def  sum_price
    item.taxin_price*quantity
  end

  ## 小計を求めるメソッド
  def subtotal
    item.price * amount
  end
  
  def self.total_price(customer)
    CartItem.where(customer_id: customer.id).inject(0){|sum, cart_item| sum + cart_item.subtotal}
  end
end

