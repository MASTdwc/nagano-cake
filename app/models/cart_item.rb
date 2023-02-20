class CartItem < ApplicationRecord
  belongs_to :custmoer,optional: true
  belongs_to :item,optional: true
  
  ## 小計を求めるメソッド
def subtotal
    item.with_tax_price * amount
end
end
