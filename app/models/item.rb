class Item < ApplicationRecord
    validates :name, presence: true
    validates :amount, presence: true
    validates :price, presence: true
end
