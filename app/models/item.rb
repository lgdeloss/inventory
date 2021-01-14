class Item < ApplicationRecord
    belongs_to :user
    validates :name, presence: true, length: {minimum:3, maximum:50}
    validates :amount, presence: true
    validates :price, presence: true
end
