class User < ApplicationRecord
    has_secure_password

    has_many :user_orders
    has_many :orders, through: :user_orders
    has_many :order_details, through: :orders

    validates :first_name, presence: true
    validates :middle_name, presence: true
    validates :last_name, presence: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP },presence: true, uniqueness: true
    validates :phone_number, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }
end