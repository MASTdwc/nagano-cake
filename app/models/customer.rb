class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :last_name, length: { in: 2..20 },
                   uniqueness: true
  validates :first_name, length: { in: 2..20 },
                   uniqueness: true
  validates :last_name_kana, presence: true, format: /\A[\p{katakana}]+\z/
  validates :first_name_kana, presence: true, format: /\A[\p{katakana}]+\z/
  validates :email, presence: true, format: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :postcode, presence: true, format: /\A\d{7}\z/
  validates :address, presence: true
  validates :phone_number, presence: true, format: /\A\d{10,11}\z/ 
  
  has_many :cart_items,dependent: :destroy
  
end

