class Item < ApplicationRecord
 has_many :order_details #中間テーブル
 has_many :orders, through: :order_details
<<<<<<< HEAD

 has_many :cart_items


=======
 has_many :cart_items,dependent: :destroy
    
>>>>>>> origin/develop
    ## 消費税を求めるメソッド
    def with_tax_price
        (price * 1.1).floor
    end
end

