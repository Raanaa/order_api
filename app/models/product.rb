class Product < ApplicationRecord
    validates :product_name, presence: true
    validates :price, presence: true
    validates :quantity, presence: true
end
