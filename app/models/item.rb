class Item < ApplicationRecord
 has_many :order_details #中間テーブル
 has_many :orders, through: :order_details
end
