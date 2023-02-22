class Item < ApplicationRecord
 has_many :order_details #中間テーブル
 has_many :orders, through: :order_details
 has_many :cart_items,dependent: :destroy
 belongs_to :genre
 
 has_one_attached :image

    ## 消費税を求めるメソッド
    def with_tax_price
        (price * 1.1).floor
    end
    
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/cake.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      image.variant(resize_to_limit: [100, 100]).processed
  end
end







