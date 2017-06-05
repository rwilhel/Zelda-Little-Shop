class Item < ApplicationRecord
  belongs_to :category

  has_many :orders_items
  has_many :orders, through: :orders_items

  extend FriendlyId
  friendly_id :name, use: :slugged

  def retired_item?
    !self.status
  end
end
