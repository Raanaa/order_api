class Order < ApplicationRecord
    has_many :user_orders
    has_many :users, through: :user_orders
    has_one :order_detail

    validates :total_price, presence: true
    validates :status, presence: true

    enum status: [ :pending, :accepted, :rejected ], _default: :pending
    validates :status, inclusion: { in: statuses.keys }
    validate_enum_attributes :status
end
