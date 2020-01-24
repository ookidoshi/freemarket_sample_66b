class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :address
  accepts_nested_attributes_for :address
  has_many :seller_products, class_name: 'Product', :foreign_key => 'seller_id'
  has_many :buyer_products, class_name: 'Product', :foreign_key => 'buyer_id'

       # バリデーション　↓うまくいかないので後程
       # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
       # VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
       # validates :nickname,                presence: true, length: {maximum: 20}
       # validates :email,                   {presence: true, format: { with: VALID_EMAIL_REGEX }}
       # validates :family_name,               presence: true
       # validates :first_name,              presence: true
       # validates :j_family_name,          presence: true
       # validates :j_first_name,         presence: true
       # validates :birthday_year,          numericality: true
       # validates :birthday_month,         numericality: true
       # validates :birthday_day,           numericality: true
       # validates :phonennumber,            {presence: true, format: { with: VALID_PHONE_REGEX }}
end
