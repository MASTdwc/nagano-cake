class Order < ApplicationRecord
    
    has_many :order_details#中間テーブル
    has_many :items, through: :order_details  #注文には商品が多くある
    
    enum payment_method: { credit_card: 0, transfer: 1 }
    enum status: { waiting: 0, payment_confirmation: 1, making: 2, preparation: 3, sent: 4}
end