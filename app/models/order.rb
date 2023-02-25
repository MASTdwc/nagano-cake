class Order < ApplicationRecord

    has_many :order_details
    belongs_to :customer
    
    enum payment_method: { credit_card: 0, transfer: 1 }
    enum status: { waiting: 0, payment_confirmation: 1, making: 2, preparation: 3, sent: 4}
    
    ## 消費税を求めるメソッド
    def with_tax_price
        (price * 1.1).floor
    end
    
    ## 小計を求めるメソッド
    def subtotal
         item.with_tax_price * amount
    end
    
    def address_display
     '〒' + postal_code + '  ' + address + '  ' + name
    end
end