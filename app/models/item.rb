class Item < ApplicationRecord
  belongs_to :category

  has_many :orders_items
  has_many :orders, through: :orders_items

end
